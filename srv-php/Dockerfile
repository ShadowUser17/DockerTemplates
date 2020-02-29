from centos:7

arg HOME=/var/nginx

env USER apache
env HOME ${HOME}

run echo -n 'apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin' >> /etc/passwd && \
	echo -n 'apache:x:48:' >> /etc/group && \
	yum install -y 'https://rpms.remirepo.net/enterprise/remi-release-7.rpm' && \
	yum install -y yum-utils && yum-config-manager --enable remi-php73 && \
	yum install -y php-fpm php-gmp php-zip php-pdo php-opcache \
				php-mysqlnd php-intl php-mbstring php-bcmath php-cli php-curl && \
	yum clean all && \
	mkdir -p ${HOME} && chown ${USER}:${USER} ${HOME}

copy --chown=root:root ./php.ini /etc/
copy --chown=root:root ./php-fpm.conf /etc/
copy --chown=root:root ./www.conf /etc/php-fpm.d/

user root

expose 9000:9000

workdir ${HOME}

cmd php-fpm -y /etc/php-fpm.conf

