#### For k3s:
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

#### For k8s:
Change cadvisor-exporter-daemon.yml
```yaml
volumes:
  - name: "containerd"
    hostPath:
      path: "/var/run/k3s/containerd"
```
```yaml
volumes:
  - name: "containerd"
    hostPath:
      path: "/var/run/containerd"
```
