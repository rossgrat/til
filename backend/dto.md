# DTO

Data Transfer Objects are a data layer that sits between an API call and a full blow object. For example, you might have a PATCH DTO object, and a CREATE DTO object, where only some subset of fields is present in the DTO compared to the main object. DTO objects then usually make available some `Apply()` function such that the DTO can be converted to a full object.

