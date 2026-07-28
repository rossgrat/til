# Proto Designs in Relational Systems
When designing protos for a system that uses a relational DB, you generally want 1 proto = 1 entity = 1 table. Entity messages should be row-shaped. View concerns (metrics, joined children, computed status, etc.) should exist on use-case specific request/response envelopes that embed the entity. Entities should not be shared across domains. Ex. `cdc` and `api` each have their own row-level `unit` entity.

This is necessary because API protos, event protos, and entity protos have differently owners and lifecycles. PI protos server FE/API consumers and must stay easy to change, and payloads are ephemeral. Event protos on compacted Kafka topics are append-only, with an unbounded compatibility window, which means restructuring, repurposing, or reprecating fields is impossible without a new topic. Entity protos mirror the DB.

The compatibility windows mentioned above are why row-level entities are not shared across domains.

Small leaf values (enums, etc.) are safe to share, but should live in their own package (not cdc, or api).

In a non-relational, document system system, you can collapse all three protos into one proto where entity = api = event. The tradeoff is proto simplicity at the cost of db denormalization, FK integrity, and hard cross-aggregate, as well as coupling the three lifecycle concerns.
