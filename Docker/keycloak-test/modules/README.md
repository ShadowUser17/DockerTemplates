#### Create DB module:
```bash
mkdir -p /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main && \
curl -L "https://repo1.maven.org/maven2/org/postgresql/postgresql/42.3.3/postgresql-42.3.3.jar" \
-o /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main/postgres-jdbc.jar && \
cp -v /opt/jboss/tools/databases/mysql/module.xml /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main/ && \
```

#### Configure Keycloak:
```bash
/opt/jboss/keycloak/bin/jboss-cli.sh --file=/opt/jboss/tools/cli/standalone-configuration.cli && \
rm -rf /opt/jboss/keycloak/standalone/configuration/standalone_xml_history
```
```bash
/opt/jboss/keycloak/bin/jboss-cli.sh --file=/opt/jboss/tools/cli/standalone-ha-configuration.cli && \
rm -rf /opt/jboss/keycloak/standalone/configuration/standalone_xml_history
```
