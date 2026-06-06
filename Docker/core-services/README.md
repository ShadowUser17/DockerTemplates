#### Traefik:
- [Documentation](https://doc.traefik.io/traefik/)
- [DockerHub](https://hub.docker.com/_/traefik)

#### PowerDNS:
- [Documentation](https://doc.powerdns.com/recursor/index.html)
- [Images](https://hub.docker.com/r/powerdns/pdns-recursor-51/tags)

#### Labels:
- traefik.enable=true
- traefik.http.routers.my-container.service=name
- traefik.http.routers.my-container.rule=Host(\`domain\`)
- traefik.http.routers.my-container.rule=Path(\`/path\`)
- traefik.http.services.my-service.loadbalancer.server.port=port
