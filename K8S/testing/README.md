#### Example:
```bash
kubectl create namespace <name>
```
```bash
kubectl -n <namespace> apply -f test-deploy.yaml
```
```bash
kubectl -n <namespace> exec -it <pod> -- <cmd>
```
