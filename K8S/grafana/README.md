#### URLs:
- [Docs](https://grafana.com/docs/grafana/latest/)
- [Images](https://hub.docker.com/r/grafana/grafana/tags)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Get access:
```bash
kubectl -n testing port-forward svc/grafana 3000
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana/ingress-test.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana/fluxcd-deploy.yml"
```
