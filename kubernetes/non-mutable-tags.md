# Non-Mutable Tags

When deploying a service with kubernetes, you want your tags to be non-mutable. Why? There are generally two ways Kubernetes churns through pods, the first is via a deployment, and the second is infra (restart, etc.). If you publish a tag, but point the tag to new commit hash, kubernetes will never deploy your code, because it won't register a change in tags. Infra rolls however, will pull down the new commit hash associated with the tag on churn, and now you have multiple pods that say the same `image`, but have different `imageIDs`.

Images and images IDs are retrievable with:
```
kubectl get pods -o custom-columns=IMAGE:".status.containerStatuses[0].image",IMAGEID:".status.containerStatuses[0].imageID"
```

Obviously the exact `constainerStatus` index varies based on the containers in the pod.
