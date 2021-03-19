FROM centos:7

ARG PDNS_WORKDIR="/var/run/pdns-recursor"

RUN yum install -y "https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm" && \
curl -o "/etc/yum.repos.d/powerdns-rec-44.repo" "https://repo.powerdns.com/repo-files/centos-rec-44.repo" && \
yum updateinfo && yum install -y pdns-recursor && mkdir -p ${PDNS_WORKDIR} && yum clean all

COPY "./recursor.conf" "/etc/pdns-recursor/recursor.conf"

WORKDIR ${PDNS_WORKDIR}

EXPOSE "53/udp"
EXPOSE "53/tcp"
EXPOSE "8082/tcp"

CMD "/usr/sbin/pdns_recursor"
