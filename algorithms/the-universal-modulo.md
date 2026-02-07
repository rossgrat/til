# The Universal Modulo
`((((start + offset) % total) + total) % total)`

The formula breaks down into 3 steps:
```
  ((x % n) + n) % n
   ───┬──   ─┬─  ─┬─
      │      │    │
      │      │    └── 3. Wrap back if we overshot
      │      └─────── 2. Shift into positive territory
      └────────────── 1. Shrink to range (-n, n)
```
  Visual walkthrough with x = -4, n = 3:
```
  Step 1: -4 % 3 = -1

          Shrinks -4 to -1 (same spot on circle, just closer to 0)

               0
              /·\
            ·2···1
           ↑
          -1 is "here" but negative
```
```
  Step 2: -1 + 3 = 2

          Shift the whole number line up by n
          Now -1 becomes 2 (the actual position on our circle)

               0
              / \
            →2---1

```
```
  Step 3: 2 % 3 = 2

          Already in range [0,3), no change needed
          (This step catches cases where step 2 overshoots)
```
  The intuition: You're converting a "signed distance from zero" into an "actual position on
  the circle" by shifting negative values up one full rotation.
