# Codegen vs. Reflection

Let's say that you have some shared worker code that consumes a bunch of different CDC-style topics, then pushes them together in some unified, shared view. Maybe you distribute this as an SDK. Let's also say that you're using Protocol Buffers on the wire for your Kafka topics. There are roughly two different ways that you could write your consumer code.

## Codegen
You could utilize the Protobuf generated code and write unique consumers for each topic, utilizing the generated protos. Ex. `brandConsumer` uses `brand.v1.Brand`. This is nice because you get compile-time checking, but the downside is that you now have to write and update N consumers, one for every topic and contract you consume.

## Reflection
The other option is to utilize the fact that protobuf is self-describing. Every protobuf package embeds its own schemas and registers them to a global registry at import time. You can then walk the registry, read the schema, including any custom options you've stamped onto the schema, and build a generic "descriptor" per entity. The descriptor is basically a user-space type (as opposed to compiler-space), similar to `reflect.Type`.

With the descriptors created, you can write one consumer that deals in a single `Entity` interface. Descriptors tell the consumer which topic to read an `Entity` from, how to decode the entity, and how different entities relate.

The trade is where errors surface: codegen fails at `go build`, reflection fails at process boot. With staged deploys that's nearly the same blast radius, but you lose IDE feedback. Note also that this isn't fully-dynamic protobuf — the hot path still deals in real generated structs, and reflection is confined to schema discovery and the decode seam. A generated data plane with a reflective control plane.

## Code Snippets

You can extend a Protobuf message like so:
```protobuf
extend google.protobuf.MessageOptions {
  cdc.v1.EntityKind entity_kind = 50001;
  string            entity_topic = 50002;
}

extend google.protobuf.FieldOptions {
  cdc.v1.EntityKind parent_kind = 50003;
}
```


Then you might update your protos with these extensions like:
```protobuf
message Brand {
  option (cdc.v1.entity_kind) = ENTITY_KIND_BRAND;
  option (cdc.v1.entity_topic) = "brands.v1";

  string id = 1;
  int64 version = 2;
  string business_id = 3 [(cdc.v1.parent_kind) = ENTITY_KIND_BUSINESS];
}
```

To walk the registry:

```go
protoregistry.GlobalFiles.RangeFilesByPackage("cdc.v1", func(fd protoreflect.FileDescriptor) bool {
  for i := 0; i < fd.Messages().Len(); i++ {
    md := fd.Messages().Get(i)
    opts := md.Options().(*descriptorpb.MessageOptions)
    kind := proto.GetExtension(opts, cdcv1.E_EntityKind).(cdcv1.EntityKind)
    // Do stuff...
  }
  return true
})

type Entity interface {
  proto.Message
  GetId() string
  GetVersion() int64
}
```


## Sources
- [Scrap your Boilerplate, Lammel, Jones](https://www.microsoft.com/en-us/research/wp-content/uploads/2003/01/hmap.pdf)
- [Go protobuf APIv2](https://go.dev/blog/protobuf-apiv2)
- [Protobuf custom options](https://protobuf.dev/programming-guides/proto2/#customoptions)
- [Protobuf self-describing messages](https://protobuf.dev/programming-guides/techniques/)
- [Google AIP-123](https://google.aip.dev/123)
- [protovalidate](https://github.com/bufbuild/protovalidate)
