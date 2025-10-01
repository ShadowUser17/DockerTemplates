#### Prepare DB:
```bash
docker compose exec -it mariadb mariadb -u root -p
```
```
CREATE DATABASE testing;
CREATE USER 'testing'@'%' IDENTIFIED BY 'testing';
GRANT ALL PRIVILEGES ON testing.* TO 'testing'@'%'; FLUSH PRIVILEGES;
```

#### URLs:
- [Documentation](https://mariadb.com/kb/en/documentation/)
- [Images](https://hub.docker.com/_/mariadb/tags)
