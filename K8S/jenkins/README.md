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
kubectl -n jenkins exec -it svc/jenkins-http -- cat /var/jenkins_home/secrets/initialAdminPassword
```
```bash
kubectl -n jenkins port-forward svc/jenkins-http 8080
```

#### Install plugins:
```bash
kubectl -n jenkins exec -it svc/jenkins-http -- bash
```
```bash
curl -L "https://raw.githubusercontent.com/ShadowUser17/BasicInstalls/master/jenkins/plugins.txt" -o /var/jenkins_home/plugins.txt
```
```bash
jenkins-plugin-cli -d /var/jenkins_home/plugins -f /var/jenkins_home/plugins.txt
```

#### Create ingress:
```bash
kubectl apply -f "https://raw.githubusercontent.com/ShadowUser17/DockerTemplates/master/K8S/jenkins/ingress-test.yml"
```
