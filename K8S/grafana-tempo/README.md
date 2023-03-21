#### Manual deploy:
```bash
kubectl apply -k .
```

#### Get access:
```bash
kubectl -n testing port-forward svc/grafana-tempo 3200
```

#### Create VPA:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-tempo/vpa-test.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-tempo/fluxcd-deploy.yml"
```
