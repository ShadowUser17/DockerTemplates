#### Prepare database:
```bash
cd ../postgres/ && docker compose up -d
```
```bash
docker compose exec -it postgres psql -U testing -d testing -W
```
```
CREATE DATABASE keycloak;
GRANT ALL PRIVILEGES ON DATABASE keycloak TO testing;
```

#### URLs:
- [Documentation](https://www.keycloak.org/documentation)
- [Images](https://quay.io/repository/keycloak/keycloak)
