from centos:7

arg USER=apache
arg HOME=/var/nginx

env USER ${USER}
env HOME ${HOME}

copy --chown=root:root ./nginx.repo /etc/yum.repos.d/

run yum install -y httpd-tools nginx && \
yum clean all && \
echo -n 'apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin' >> /etc/passwd && \
echo -n 'apache:x:48:' >> /etc/group && \
mkdir -p '/usr/share/httpd' && \
mkdir -p ${HOME} && chown ${USER}:${USER} ${HOME}

user ${USER}

expose 80:80

workdir ${HOME}

cmd nginx -g 'daemon off;'

