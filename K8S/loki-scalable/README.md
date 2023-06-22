### Warning! This is an experimental deployment.

#### URLs:
- [Docs](https://github.com/grafana/loki/tree/main/docs/sources)
- [Images](https://hub.docker.com/r/grafana/loki/tags)

#### Required MinIO/S3 storage buckets:
- For data: `loki-data`
- For ruler: `loki-ruler`

#### Manual scalable deploy:
```bash
kubectl apply -k .
```
