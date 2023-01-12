#### URLs:
- [minio](https://github.com/minio/minio/blob/master/README.md)
- [DockerHub](https://hub.docker.com/r/minio/minio)

#### Access from namespaces:
```yaml
template:
  metadata:
    labels:
      required.storage: "minio"
```
```yaml
template:
  metadata:
    labels:
      required.storage: "s3"
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Execute command:
```bash
kubectl -n testing exec -it svc/minio -- sh
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/minio/fluxcd-deploy.yml"
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/minio/ingress-test.yml"
```
