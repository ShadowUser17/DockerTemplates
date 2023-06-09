### Warning! This is an experimental deployment.
This deployment based on [kube-thanos](https://github.com/thanos-io/kube-thanos)

#### Required MinIO/S3 storage buckets:
- `thanos-data`

#### URLs:
- [Documentation](https://thanos.io/tip/thanos/getting-started.md/)
- [Releases](https://github.com/thanos-io/thanos/releases)
- [Images](https://hub.docker.com/r/thanosio/thanos/tags)

#### Manual deploy:
```bash
kubectl apply -k .
```
