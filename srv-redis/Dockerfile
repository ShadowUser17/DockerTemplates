from centos:7

run yum install -y epel-release && \
	yum install -y redis && \
	yum clean all

copy --chown=root:root ./redis.conf /etc/

user root

expose 6379:6379

cmd /usr/bin/redis-server /etc/redis.conf

