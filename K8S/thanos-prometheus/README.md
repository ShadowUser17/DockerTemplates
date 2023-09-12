### Warning! This is an experimental deployment.

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

#### Get access to thanos:
```bash
kubectl -n testing port-forward svc/thanos-front 9090
```

#### Get access to prometheus:
```bash
kubectl -n testing port-forward svc/thanos-prometheus 9090
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/thanos-prometheus/ingress-nginx.yml"
```
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/thanos-prometheus/ingress-istio.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/thanos-prometheus/fluxcd-deploy.yml"
```
