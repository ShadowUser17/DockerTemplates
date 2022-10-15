#### Deploy prometheus-cluster:
```bash
kubectl apply -k .
```

#### Fix error for k3s:
Change /var/lib/rancher/k3s/server/manifests/metrics-server/metrics-server-deployment.yaml
```yaml
containers:
  - name: metrics-server
    args:
    - --cert-dir=/tmp
    - --secure-port=4443
    - --kubelet-insecure-tls
    - --kubelet-preferred-address-types=InternalIP
    - --kubelet-use-node-status-port
    - --metric-resolution=30s
```
