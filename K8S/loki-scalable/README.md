### Warning! This is an experimental deployment.

#### Required MinIO/S3 storage buckets:
- For data: `loki-data`
- For ruler: `loki-ruler`

#### Manual scalable deploy:
```bash
kubectl apply -k .
```
