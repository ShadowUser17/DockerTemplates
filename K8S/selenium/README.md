#### URLs:
- [Source](https://github.com/SeleniumHQ/docker-selenium)
- [Images](https://hub.docker.com/r/selenium/standalone-chrome/tags)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/selenium/ingress-nginx.yml"
```
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/selenium/ingress-istio.yml"
```
