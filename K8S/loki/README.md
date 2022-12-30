#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/loki/fluxcd-deploy.yml"
```

#### Get Loki config:
```bash
kubectl exec -n prometheus -it svc/loki -- wget 127.0.0.1:3100/config -O -
```
