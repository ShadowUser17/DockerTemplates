from centos:7

arg HOME=/var/pyapp
arg USER=pyapp

env USER ${USER}
env HOME ${HOME}

run yum install -y gcc python3 python3-devel python3-pip python3-setuptools && \
	yum clean all && \
	pip3 install --no-cache-dir --upgrade pip && \
	useradd ${USER} -u 2000 -m -d ${HOME}

copy ./requirements.txt ${HOME}/

workdir ${HOME}

run pip3 install --no-cache-dir -r requirements.txt

user ${USER}

expose 8001:8001

cmd uwsgi --ini uwsgi.ini

