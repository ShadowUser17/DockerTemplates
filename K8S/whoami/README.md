#### URLs:
- [Source](https://github.com/traefik/whoami)
- [Images](https://hub.docker.com/r/traefik/whoami/tags)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/whoami/fluxcd-deploy.yml"
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/whoami/ingress-nginx.yml"
```
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/whoami/ingress-istio.yml"
```
