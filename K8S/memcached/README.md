#### URLs:
- [memcached](https://hub.docker.com/r/bitnami/memcached/tags)
- [memcached-exporter](https://hub.docker.com/r/bitnami/memcached-exporter/tags)

#### Access from namespaces:
```yaml
template:
  metadata:
    labels:
      required.cache: "memcached"
```

#### Get access:
```bash
kubectl -n testing port-forward svc/memcached 11211
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/memcached/fluxcd-deploy.yml"
```
