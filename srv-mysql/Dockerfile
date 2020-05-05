FROM alpine

ARG USER=mysql
ARG HOME=/var/lib/mysql
ARG PORT=3306

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
rm -rvf /etc/my.cnf /etc/my.cnf.d && \
mkdir /run/mysqld && chown ${USER}:${USER} /run/mysqld

ENV USER ${USER}
ENV HOME ${HOME}
ENV PORT ${PORT}

USER ${USER}
WORKDIR ${HOME}
EXPOSE ${PORT}

CMD mysql_install_db --basedir=/usr --datadir=${HOME} --user=${USER} --rpm ; \
mysqld --basedir=/usr --bind-address=0.0.0.0 --port=${PORT} --pid-file=${HOME}/mysqld.pid

