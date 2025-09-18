#### Prepare DB:
```bash
docker compose exec -it postgres psql -U postgres -W
```
```
CREATE DATABASE testing;
CREATE USER testing WITH ENCRYPTED PASSWORD 'testing';
GRANT ALL PRIVILEGES ON DATABASE testing TO testing;
```

#### URLs:
- [Documentation](https://www.postgresql.org/docs/)
- [Images](https://hub.docker.com/_/postgres/tags)
