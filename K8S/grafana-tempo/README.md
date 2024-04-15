#### URLs:
- [Docs](https://github.com/grafana/tempo/tree/main/docs/sources/tempo)
- [Images](https://hub.docker.com/r/grafana/tempo/tags)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-tempo/fluxcd-deploy.yml"
```
