#### Exporting the realm:
```bash
docker exec -it keycloak.docker.localhost \
"/opt/jboss/keycloak/bin/standalone.sh" \
"-Djboss.socket.binding.port-offset=100" \
"-Dkeycloak.migration.action=export" \
"-Dkeycloak.migration.provider=singleFile" \
"-Dkeycloak.migration.realmName=master" \
"-Dkeycloak.migration.usersExportStrategy=REALM_FILE" \
"-Dkeycloak.migration.file=/tmp/master.json"
```

#### Importing the realm:
```bash
docker run --rm -it \
-e "KEYCLOAK_USER=admin" \
-e "KEYCLOAK_PASSWORD=admin" \
-e "KEYCLOAK_IMPORT=/tmp/master-realm.json" \
-v "/tmp/master-realm.json:/tmp/master-realm.json:rw" \
quay.io/keycloak/keycloak:19.0.3-legacy
```
