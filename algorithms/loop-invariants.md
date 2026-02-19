# Loop Invariants
Loop invariants are a means of proving the correctness of an algorithm, where the algorithm has loops and is non-recursive (at least so far in my studies!)

The following is the process to prove a loop invariant.

1. Understand the algorithm. Understand the inputs, the loop action, and the return value.
2. Find the loop invariant. This will be either a mathematical equation or logical condition that holds after some iteration of the loop.
3. Prove initialization, show that the invariant holds after the first iteration of the loop.
4. Prove maintenance, show that the loop holds for a generalized, subsequent iteration.
5. Prove termination, show that the loop holds for the final iteration.

## Algebraic Proofs for Maintenance 
If you have an algebraic invariant, and need to prove maintenance, you can follow these steps:
1. Apply the loop body, where you add another iteration to your invariant.
2. Write the target, where you plug i-1 into the invariant in place of i, then simplify
3. Show steps 1 and 2 are identical

This is a little confusing, there is more context [here](https://www.algorist.com/algowiki/Chapter_1/solutions/1.9.html)
