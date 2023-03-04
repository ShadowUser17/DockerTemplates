### Warning! This is an experimental deployment.

#### URLs:
- [Documentation](https://www.keycloak.org/documentation-archive.html)
- [Quickstarts](https://github.com/keycloak/keycloak-quickstarts)
- [Downloads](https://www.keycloak.org/downloads-archive.html)
- [Guides](https://www.keycloak.org/guides)

#### Get access:
```bash
kubectl -n testing port-forward svc/keycloak 8080
```

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/keycloak/ingress-test.yml"
```
