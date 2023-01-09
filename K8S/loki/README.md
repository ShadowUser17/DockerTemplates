#### Manual single deploy:
```bash
kubectl apply -k ./single
```

#### Manual scalable deploy:
```bash
kubectl apply -k ./scalable
```

#### Automatic single deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/loki/single/fluxcd-deploy.yml"
```

#### Automatic scalable deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/loki/scalable/fluxcd-deploy.yml"
```

#### Get Loki config:
```bash
kubectl exec -n prometheus -it svc/loki -- wget 127.0.0.1:3100/config -O -
```
