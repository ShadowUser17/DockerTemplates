#### URLs:
- [postgresql](https://hub.docker.com/r/bitnami/postgresql)
- [postgresql-exporter](https://hub.docker.com/r/bitnami/postgresql-exporter)

#### Access from namespaces:
```yaml
template:
  metadata:
    labels:
      required.db: "psql"
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/postgres/fluxcd-deploy.yml"
```
