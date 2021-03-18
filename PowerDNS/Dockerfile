FROM centos:7

RUN yum install -y yum-plugin-priorities && mkdir "/var/run/pdns-recursor" && \
yum install -y "https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm" && \
curl -o "/etc/yum.repos.d/powerdns-rec-44.repo" "https://repo.powerdns.com/repo-files/centos-rec-44.repo" && \
yum updateinfo && yum install -y pdns-recursor && yum clean all

COPY "./recursor.conf" "/etc/pdns-recursor/recursor.conf"
WORKDIR "/etc/pdns-recursor"
EXPOSE "53/udp"
EXPOSE "8082/tcp"
CMD "/usr/sbin/pdns_recursor"
