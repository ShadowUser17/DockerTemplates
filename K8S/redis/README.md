#### URLs:
- [redis](https://hub.docker.com/r/bitnami/redis)
- [redis-exporter](https://hub.docker.com/r/bitnami/redis-exporter)

#### Access from namespaces:
```yaml
template:
  metadata:
    labels:
      required.cache: "redis"
```

#### Get access:
```bash
kubectl -n testing port-forward svc/redis 6379
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/redis/fluxcd-deploy.yml"
```
