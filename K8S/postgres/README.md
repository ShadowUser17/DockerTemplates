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

#### Exec command:
```bash
kubectl -n testing exec -it postgres-0 -- psql -d testing -U testing -W
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Create VPA:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/postgres/vpa-test.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/postgres/fluxcd-deploy.yml"
```
