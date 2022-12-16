#### URLs:
- [whoami](https://github.com/traefik/whoami/blob/master/README.md)
- [DockerHub](https://hub.docker.com/r/traefik/whoami)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/whoami/fluxcd-deploy.yml"
```
