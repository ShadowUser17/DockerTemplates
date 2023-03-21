#### Manual deploy:
```bash
kubectl apply -k .
```

#### Get access:
```bash
kubectl -n testing port-forward svc/grafana-testing 3000
```

#### Create VPA:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-testing/vpa-test.yml"
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-testing/ingress-test.yml"
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/grafana-testing/fluxcd-deploy.yml"
```
