from centos:7

arg PGPORT=5432

env PGDATA /var/lib/pgsql/data
env LANG en_US.UTF-8
env PGPORT ${PGPORT}

run yum install -y postgresql postgresql-server postgresql-contrib && \
yum clean all

user postgres

workdir /var/lib/pgsql

expose ${PGPORT}:${PGPORT}

cmd /usr/bin/initdb --pgdata ${PGDATA} --locale ${LANG} --auth-host "trust"; \
/usr/bin/postgres -D ${PGDATA} -h "0.0.0.0" -p ${PGPORT} -s

