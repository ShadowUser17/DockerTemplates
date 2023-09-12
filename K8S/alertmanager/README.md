#### URLs:
- [Docs](https://prometheus.io/docs/alerting/latest/overview/)
- [Releases](https://github.com/prometheus/alertmanager/releases)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Get access:
```bash
kubectl -n testing port-forward svc/alertmanager 9093
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/alertmanager/ingress-nginx.yml"
```
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/alertmanager/ingress-istio.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/alertmanager/fluxcd-deploy.yml"
```
