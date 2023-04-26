#### Get deployments:
```bash
curl -L "https://repo1.maven.org/maven2/org/mindrot/jbcrypt/0.4/jbcrypt-0.4.jar" -o ./deployments/jbcrypt-0.4.jar
```
```bash
curl -L "https://github.com/leroyguillaume/keycloak-bcrypt/releases/download/1.5.3/keycloak-bcrypt-1.5.3.jar" -o ./deployments/keycloak-bcrypt-1.5.3.jar
```
```bash
curl -L "https://github.com/aerogear/keycloak-metrics-spi/releases/download/3.0.0/keycloak-metrics-spi-3.0.0.jar" -o ./deployments/keycloak-metrics-spi-3.0.0.jar
```

#### Set permissions:
```bash
chown -R 1000:0 ./deployments
```
