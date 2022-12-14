#### URLs:
- [kubernetes-installing](https://www.jenkins.io/doc/book/installing/kubernetes/)
- [kubernetes-plugin](https://plugins.jenkins.io/kubernetes/)

#### Deploy:
```bash
kubectl apply -k .
```
```bash
kubectl exec -n jenkins -it svc/jenkins-http -- cat /var/jenkins_home/secrets/initialAdminPassword
```
