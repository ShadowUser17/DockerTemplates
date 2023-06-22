#### URLs:
- [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics/releases)
- [node-exporter](https://github.com/prometheus/node_exporter/releases)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/prometheus-exporters/fluxcd-deploy.yml"
```
