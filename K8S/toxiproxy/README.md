#### URLs:
- [Source](https://github.com/Shopify/toxiproxy)
- [Images](https://github.com/Shopify/toxiproxy/pkgs/container/toxiproxy)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Enable monitoring:
```bash
kubectl apply -f monitoring.yml
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/toxiproxy/fluxcd-deploy.yml"
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/toxiproxy/ingress-nginx.yml"
```
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/toxiproxy/ingress-istio.yml"
```
