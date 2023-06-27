### Warning! Loki using filesystem storage in standalone mode!

#### URLs:
- [Docs](https://github.com/grafana/loki/tree/main/docs/sources)
- [Images](https://hub.docker.com/r/grafana/loki/tags)

#### Manual single deploy:
```bash
kubectl apply -k .
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-loki/ingress-test.yml"
```

#### Automatic single deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-loki/fluxcd-deploy.yml"
```

#### Get Loki config:
```bash
kubectl exec -n testing -it svc/grafana-loki -- wget 127.0.0.1:3100/config -O -
```
