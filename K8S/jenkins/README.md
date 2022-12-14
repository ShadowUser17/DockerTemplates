#### Deploy:
```bash
kubectl apply -k .
```
```bash
kubectl exec -n jenkins -it svc/jenkins-http -- cat /var/jenkins_home/secrets/initialAdminPassword
```
