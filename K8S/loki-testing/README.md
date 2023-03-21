### Warning! Loki using storage: filesystem in standalone mode!

#### Manual single deploy:
```bash
kubectl apply -k .
```

#### Automatic single deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/loki-testing/fluxcd-deploy.yml"
```

#### Get Loki config:
```bash
kubectl exec -n testing -it svc/loki-testing -- wget 127.0.0.1:3100/config -O -
```