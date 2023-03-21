#### Access from namespaces:
Support types are `minio` or `s3`
```yaml
template:
  metadata:
    labels:
      required.storage: "minio"
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

#### Create VPA:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/minio/vpa-test.yml"
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/minio/ingress-test.yml"
```
