from centos:7

arg USER=mysql
arg HOME=/var/lib/mysql
arg PORT=3306

run yum install -y mariadb mariadb-server mariadb-test && \
	yum clean all && \
	mkdir -p ${HOME} && chown ${USER}:${USER} ${HOME}

env USER ${USER}
env HOME ${HOME}
env PORT ${PORT}

user ${USER}
workdir ${HOME}

expose ${PORT}

cmd mysql_install_db --basedir=/usr --datadir=${HOME} --user=${USER} --rpm; \
	/usr/libexec/mysqld --basedir=/usr --port ${PORT} --pid-file=${HOME}/mysql.pid

