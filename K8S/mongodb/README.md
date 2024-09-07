#### URLs:
- [mongodb](https://hub.docker.com/r/bitnami/mongodb)

#### Access from namespaces:
```yaml
template:
  metadata:
    labels:
      required.db: "mongo"
```

#### Get access:
```bash
kubectl -n testing port-forward svc/mongodb 27017
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/mongodb/fluxcd-deploy.yml"
```
