# MMAP Top to Bottom


`mmap` in the context of `malloc` in C is responsible for retrieving virtual memory blocks from the OS, distinct from the program's heap and `brk/sbrk`, and that then used for the dynamic memory of the C program.

But how does mmap work? In this TIL I'll explore how an mmap call goes from `malloc` down to the CPU. The ISA I'll be using in this example is RISC-V.

## `mmap` Call Stack

1. `malloc` calls `mmap` ([src](https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/mmap64.c))
The GNU C standard library (`glibc`) a function called `mmap64`, which is architecture independent. `mmap64` does some validation, then calls `MMAP_CALL`.

2. `MMAP_CALL` calls `internal_syscall6` 
`MMAP_CALL` is a macro that plugs the MMAP syscall (222 o RISC-V) into the assembly defined in `internal_syscall6`.


3. `MMAP_CALL` calls `internal_syscall6` ([src](https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/riscv/sysdep.h))
`internal_syscall6` is a function that takes six arguments for a syscall. It is responsible for emitting the proper assembly code in the compiled program.

4. The program is running, and the program counter hits `scall ...` assembly instructions.
When this happens, the CPU flips into kernel mode (ring 0 privileges). The program counter is saved, and the CPU jumps to the kernel's trap handler.

5. syscall table lookup happens ([src](https://github.com/torvalds/linux/blob/master/arch/riscv/kernel/syscall_table.c)) ([src](https://github.com/torvalds/linux/blob/master/mm/mmap.c))
The kernel looks up the syscall by number from the syscall table, then executes the function at that number.
For RISC-V, the syscall number is 222, and the function is `ksys_mmap_pgoff()`, which does some validation and checking of the request type (in the case of malloc, determining that the mapping is anonymous, and not tied to a file). This function will then call `vm_mmap_pgoff()`

6. `vm_mmap_pgoff()` ([src](https://raw.githubusercontent.com/torvalds/linux/master/mm/util.c))
This function does some housekeeping and locking to ensure that two processes aren't both trying to update the process memory.

7. `do_mmap()` ([src](https://raw.githubusercontent.com/torvalds/linux/master/mm/mmap.c))
This is where the magic happens. This function:
1. Computes validation and sanity checks (length checks and roundup, too many mappings, overflow)
2. Computes permission flags
3. Finds a gap in the address space
4. Permission checks 
5. Handle empty mapping type (empty mappings are one of `MAP_SHARED`, `MAP_PRIVATE`, `MAP_ANONYMOUS`).
6. Create the MAP_PRIVATE
7. Decide population

Phases 3 and 6 are the interesting parts that maybe I'll have to dive deeper into at some point.

## `libc` and Assembly Instructions for syscalls

Looking at the first three steps for this naturally raises the question: If I am not using `glibc`, how do I make a syscall? The answer is that the you would someone have to insert the assembly instruction into the program you are running. Interestingly, most modern languages are either written in C, link to `libc` or have C runtimes.

- CPython — the default Python. Written in C.
- CRuby/MRI — the default Ruby. Written in C.
- Lua / LuaJIT — written in C/assembly
- PHP (Zend engine) — C
- Perl — C
- R — C and Fortran
- Node.js / V8 — C++, links libc
- OpenJDK (Java) — the JVM itself is C++, links libc
- Erlang BEAM VM — C
- OCaml — compiler is OCaml, but the runtime is C
- GHC (Haskell) — compiler is Haskell, but the runtime is C

The modern languages that make direct syscalls are:
- Go - Has hand-written assembly for each architecture and makes syscalls directly
- Zig - Designed to avoic `libc`, has own syscall stubs
- Rust - Standard library links `libc` by default, but can be removed with `no_std`
