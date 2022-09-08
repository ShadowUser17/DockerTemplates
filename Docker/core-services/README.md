#### Traefik:
- [Documentation](https://doc.traefik.io/traefik/)
- [DockerHub](https://hub.docker.com/_/traefik)

#### CoreDNS:
- [Documentation](https://coredns.io/manual/toc/)
- [DockerHub](https://hub.docker.com/r/coredns/coredns)

#### Watchtower:
- [Documentation](https://containrrr.dev/watchtower/)
- [DockerHub](https://hub.docker.com/r/containrrr/watchtower)

#### Labels:
- traefik.enable=true
- traefik.http.routers.my-container.service=name
- traefik.http.routers.my-container.rule=Host(\`domain\`)
- traefik.http.routers.my-container.rule=Path(\`/path\`)
- traefik.http.services.my-service.loadbalancer.server.port=port
