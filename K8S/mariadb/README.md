#### URLs:
- [mariadb](https://hub.docker.com/r/bitnami/mariadb)

#### Access from namespaces:
```yaml
template:
  metadata:
    labels:
      required.db: "mysql"
```

#### Get access:
```bash
kubectl -n testing port-forward svc/mariadb 3306
```

#### Exec command:
```bash
kubectl -n testing exec -it mariadb-0 -- mariadb -u root -D testing -p
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/mariadb/fluxcd-deploy.yml"
```
