#### Required MinIO/S3 storage buckets:
- For data: `loki-data`
- For ruler: `loki-ruler`

#### Manual scalable deploy:
```bash
kubectl apply -k .
```

#### Automatic scalable deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/loki-scalable/fluxcd-deploy.yml"
```