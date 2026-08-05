# Edge-trigged vs. Level-trigged

Let's say you're building some kind of change stream orchestrator. Your orchestrator reads from one or more log streams (Kafka), and each event you care about has `old` and `new` attached. The question is then, what do `old` and `new` mean, exactly?

There are two terms in distributed systems that are relevant (borrowed originally from hardware interrupts). 
- Edge-triggered - Deliver every transition. "Field X changed from value A to value B".
- Level-triggered - Deliver the current state. "Field X is now B".

Edge-triggered systems can be known as:
- CDC (Change Data Capture)
- Event-carried state transfer
- Record/stream semantics (Kafka Streams KStream)
- Op-based replication

Level-triggered systems can be known as:
- Reconciliation
- Desired-state management
- Table semantics (Kafka Streams KTable)
- State-based replication

Edge-triggered systems include:
- Debezium
- DynamoDB streams
- MySQL binalog row forward
- Postgres logical replication
- MongoDB change streams
- EventStore/event sourcing
- Op-based CRDTs (Conflict Free Replicated Data Type)

Level-triggered systems include:
- Kubernetes controllers
- React
- State-based CRDTs
- Anti-entropy repair in Dynamo-style stores

Tradeoffs
- Edge-triggered systems must process every transition, including bounces where one field flips then flips back. Level-triggered systems absorb bursts by only providing the net delta
- Edge-triggered systems make the consume work at the write rate, Level-triggered systems only scale with the change rate
- Edge-triggered systems provide the consumer position for free via the transport offest/cursor (ex. Kafka offset), consumers are stateless. Level-triggered systems must remember what they last say if they want to provide a `LastSeen` field next to `Current`
- Edge-triggered systems have deterministic replay or redelivery, level-triggered systems are timing-dependent
- Edge-triggered systems require a snapshot fallback if a gap appears. Level-triggered systems are self-healing by construction, since the next event fixes everything and represents the current state of the system


Some other notes:
- It is impossible to *always* have an old and new on an edge-trigged sytle message, due to compaction, log trimming, or just messages generally getting destroyed. The industry standard fallback is a `SNAPSHOT` event type alongside the standard `CREATE`, `UPDATE`, `DELETE`
