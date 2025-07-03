#### Send message:
```bash
logger -n 127.0.0.1 -T -P 6514 'TCP test!'
```
```bash
logger -n 127.0.0.1 -d -P 5514 'UDP test!'
```

#### Reload config:
```bash
docker compose exec syslog-ng syslog-ng-ctl reload -c /config/syslog-ng.ctl
```

#### Documentation:
- [syslog-ng](https://syslog-ng.github.io/)
- [DockerHub](https://hub.docker.com/r/linuxserver/syslog-ng)
