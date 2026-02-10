# AWS IAM Roles
AWS IAM roles are a way of restricting service access to resources. Roles are created for services and have a "Trust Policy", which is what service can assume the role, and a "Permission Policy", for what the service is allowed to do. These roles generally follow the "Principle of Least Privilege".

Services assume roles with `sts:assumeRole`. AWS STS is the "Security Token Service", and provides temporay credentials which are:
- 'AccessKeyId`
- `SecretAccessKey`
` `SessionToken

