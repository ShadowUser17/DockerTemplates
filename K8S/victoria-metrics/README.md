### Warning! This is an experimental deployment.

#### URLs:
- [Docs](https://docs.victoriametrics.com/)
- [Images](https://hub.docker.com/r/victoriametrics/victoria-metrics/)
- [Source](https://github.com/VictoriaMetrics/VictoriaMetrics)
- [Charts](https://github.com/VictoriaMetrics/helm-charts)

#### Get access:
```bash
kubectl -n testing port-forward svc/vmetrics 8428
```

#### Manual deploy:
```bash
kubectl apply -k .
```
