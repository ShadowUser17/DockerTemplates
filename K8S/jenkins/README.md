#### Deploy:
```bash
kubectl apply -k .
```
```bash
kubectl exec -n jenkins -it svc/jenkins -- cat /var/jenkins_home/secrets/initialAdminPassword
```
