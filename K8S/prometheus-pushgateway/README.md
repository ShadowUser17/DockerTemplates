#### URLs:
- [Docs](https://github.com/prometheus/pushgateway/blob/master/README.md)
- [Images](https://hub.docker.com/r/prom/pushgateway/tags)
- [Releases](https://github.com/prometheus/pushgateway/releases)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Get access:
```bash
kubectl -n testing port-forward svc/pushgateway 9092
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/prometheus-pushgateway/ingress-nginx.yml"
```
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/prometheus-pushgateway/ingress-istio.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/prometheus-pushgateway/fluxcd-deploy.yml"
```
