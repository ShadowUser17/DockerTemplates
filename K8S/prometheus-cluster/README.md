#### URLs:
- [prometheus](https://github.com/prometheus/prometheus/releases)
- [grafana](https://github.com/grafana/grafana/releases)
- [alertmanager](https://github.com/prometheus/alertmanager/releases)
- [node-exporter](https://github.com/prometheus/node_exporter/releases)
- [blackbox-exporter](https://github.com/prometheus/blackbox_exporter/releases)
- [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics/releases)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/prometheus-cluster/fluxcd-deploy.yml"
```
