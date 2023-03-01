#### URLs:
- [postgresql](https://hub.docker.com/r/bitnami/postgresql)

#### Access from namespaces:
```yaml
template:
  metadata:
    labels:
      required.db: "psql"
```

#### Get access:
```bash
kubectl -n testing port-forward svc/postgresql 5432
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/postgres/fluxcd-deploy.yml"
```
