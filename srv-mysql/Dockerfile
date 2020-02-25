from centos:7

arg USER=mysql
arg HOME=/var/lib/mysql
arg PORT=3306

env USER ${USER}
env HOME ${HOME}
env PORT ${PORT}

run yum install -y mariadb mariadb-server mariadb-test && \
yum clean all && \
mkdir -p ${HOME} && chown ${USER}:${USER} ${HOME}

user ${USER}:${USER}

expose ${PORT}:${PORT}

workdir ${HOME}

cmd mysql_install_db --basedir=/usr --rpm; \
/usr/libexec/mysqld --basedir=/usr --port ${PORT} --pid-file=${HOME}/mysql.pid

