#### URLs:
- [Docs](https://github.com/grafana/tempo/tree/main/docs/sources/tempo)
- [Images](https://hub.docker.com/r/grafana/tempo/tags)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Get access:
```bash
kubectl -n testing port-forward svc/grafana-tempo 3200
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-tempo/ingress-test.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-tempo/fluxcd-deploy.yml"
```
