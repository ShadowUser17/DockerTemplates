#### URLs:
- [kubernetes-installing](https://www.jenkins.io/doc/book/installing/kubernetes/)
- [jenkins-docker](https://github.com/jenkinsci/docker/blob/master/README.md)
- [kubernetes-plugin](https://plugins.jenkins.io/kubernetes/)

#### Manual deploy:
```bash
kubectl apply -k .
```

#### Automatic deploy:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/jenkins/fluxcd-deploy.yml"
```

#### Initial access:
```bash
kubectl exec -n jenkins -it svc/jenkins-http -- cat /var/jenkins_home/secrets/initialAdminPassword
```
```bash
kubectl port-forward -n jenkins svc/jenkins-http 8080
```
