#### URLs:
- [Source](https://github.com/Ealenn/Echo-Server)
- [Images](https://hub.docker.com/r/ealen/echo-server/tags)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/echo-server/fluxcd-deploy.yml"
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/echo-server/ingress-nginx.yml"
```
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/echo-server/ingress-istio.yml"
```

#### Create alertmanager config:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/echo-server/alertmanager-config.yml"
```
