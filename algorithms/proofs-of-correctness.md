# Proofs of Correctness
There are roughly four ways to prove the correctness of an algorithm.
1. Find a counterexample. In this case, you're proving the algorithm is incorrect.
2. Do a proof by induction for recursive algorithms. Use strong induction where the recursive algorithm jumps to values less than `n-1`.
3. Do a proof by contradiction. Assume the opposite of what you want to prove, then show that assumption leads to a logical impossibility.
4. Do a proof by loop invariant for looped, non-recursive algorithms. Find an invariant that holds after each iteration of the loop, then logically or algebraically, prove the invariant holds at initialization, maintenance, and termination.
