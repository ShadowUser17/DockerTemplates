#### Access from namespaces:
Support type is `redis`
```yaml
template:
  metadata:
    labels:
      required.cache: "redis"
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Execute command:
```bash
kubectl -n testing exec -it svc/redis -- sh
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/redis/fluxcd-deploy.yml"
```
