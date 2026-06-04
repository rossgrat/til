# launchd & pmset & caffeinate

Let's say I have the following problem. At a certain time each day I want my computer to do something. It should do this even if I'm not actively using it. It should wake up if it is asleep, and it should complete its task with or without AC power.

We can do this on an Apple M4-series Macbook using two tools.

`launchd` - MacOS process scheduler. We can configure a `LaunchAgent` that says "run this command at these times".
`pmset` - Power Management Config. We can set a hardware RTC (real-time clock) alarm that will power the CPU on at a specific time
`caffeinate` - Tool for keep MacOS awake while completing some work. We wrap our command with `caffeinate` so that MacOS doesn't sleep before we've completed `pinata`.

Other notes:
- `pmset` triggers what is called a `DarkWake`, this is a wake state that is only meant for simple maintenance tasks, and isn't a full computer wakeup.
