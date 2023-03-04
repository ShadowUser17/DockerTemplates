#### URLs:
- [Source](https://github.com/traefik/whoami/blob/master/README.md)
- [Images](https://hub.docker.com/r/traefik/whoami)

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
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/whoami/ingress-test.yml"
```
