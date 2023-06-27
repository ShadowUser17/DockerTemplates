#### URLs:
- [Docs](https://prometheus.io/docs/introduction/overview/)
- [Releases](https://github.com/prometheus/prometheus/releases)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Get access:
```bash
kubectl -n testing port-forward svc/prometheus 9090
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/prometheus/ingress-test.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/prometheus/fluxcd-deploy.yml"
```
