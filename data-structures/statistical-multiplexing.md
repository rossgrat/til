# Statistical Multiplexing

This is the idea that a shared pool absorbs skew better than many private reservations, at the cost of per-entity fairness.

So let's say that you're receiving a bunch of events that you need to store briefly, process, then remove. You could create a buffer for each entity (maybe bounded ring buffer), or you could create one shared buffer that every entity stores a pointer in. If you have one entity spiking or bursting, it will use up the spaces that the other entities aren't using, rather than be bounded by the size of its own pool.

A nice property of the roll is that insertion order = age for all entities, so trimming all entities older than X only looks at one data structure.

Similar systems:
- Bitcask - Riak storage engine
- Kafka
- LMAX disruptor
- Kernel/NIC packet rings
- WAL tails


