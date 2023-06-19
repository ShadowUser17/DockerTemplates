#### Access from namespaces:
```yaml
template:
  metadata:
    labels:
      required.pushgateway: "true"
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Get access:
```bash
kubectl -n testing port-forward svc/pushgateway 9091
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/prometheus-pushgateway/fluxcd-deploy.yml"
```