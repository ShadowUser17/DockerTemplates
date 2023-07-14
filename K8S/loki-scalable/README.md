### Warning! This is an experimental deployment.

#### URLs:
- [Docs](https://grafana.com/docs/loki/latest/)
- [Images](https://hub.docker.com/r/grafana/loki/tags)

#### Required MinIO/S3 storage buckets:
- For data: `loki-data`
- For ruler: `loki-ruler`

#### Manual scalable deploy:
```bash
kubectl apply -k .
```
