#### URLs:
- [Docs](https://k6.io/docs/)
- [DockerHub](https://hub.docker.com/r/grafana/k6)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/k6-test/fluxcd-deploy.yml"
```
