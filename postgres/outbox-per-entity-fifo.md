# Outbox Per-Entity FIFO

The Transactional Outbox pattern is a great way to use eventual consistency and prevent invalid state, however, most transaction outboxes assume no ordering. If we want an ordered transactional outbox, here is one approach:

1. Add a "partition key" to each outbox
2. Tag entities that require FIFO ordering with the same partition keys. Ex. for a CDC of some "Person" table, each partition key would be the ID of the person entity
3. When loading outbox jobs, use Advisory Locks to lock the given partition key for one or more tasks (important for multi-service outbox processors)
3. When fanning out outbox tasks in the outbox handler (to goroutines or some other concurrency primitive), group by partition key and order by `created_time`

Note: Partition keys must match Kafka keys to ensure correct downstream ordering


