#### Documentation:
- [Traefik](https://doc.traefik.io/traefik/)
- [DockerHub](https://hub.docker.com/_/traefik)

#### Labels:
- traefik.enable=true
- traefik.http.routers.<my-container>.rule=Host(\`<domain>\`)
- traefik.http.routers.<my-container>.service=<name>
- traefik.http.services.<my-service>.loadbalancer.server.port=<port>
