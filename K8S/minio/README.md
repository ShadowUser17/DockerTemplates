#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/minio/fluxcd-deploy.yml"
```

#### Execute command:
```bash
kubectl -n testing exec -it svc/minio -- sh
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/minio/ingress-test.yml"
```
