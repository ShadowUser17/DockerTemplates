### Warning! This is an experimental deployment.

#### URLs:
- [Documentation](https://www.keycloak.org/documentation-archive.html)
- [Quickstarts](https://github.com/keycloak/keycloak-quickstarts)
- [Downloads](https://www.keycloak.org/downloads-archive.html)
- [Images](https://hub.docker.com/r/jboss/keycloak)
- [Guides](https://www.keycloak.org/guides)

#### Hosts:
- 172.30.0.11 (keycloak-one.docker.localhost)
- 172.30.0.12 (keycloak-two.docker.localhost)

#### Add first user:
```bash
docker exec -it keycloak-one.docker.localhost /opt/jboss/keycloak/bin/add-user-keycloak.sh -u admin -p admin
```
```bash
docker container restart keycloak-one.docker.localhost
```

#### Login with kcadm:
```bash
docker exec -it keycloak-one.docker.localhost \
/opt/jboss/keycloak/bin/kcadm.sh config credentials --server "http://localhost:8080/auth" --realm master --user admin --password admin
```
