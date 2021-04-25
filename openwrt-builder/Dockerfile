FROM debian

ARG git_user="dev"
ARG git_mail="dev@localhost"

RUN apt-get update && \
    apt-get -y install build-essential libncurses5-dev libncursesw5-dev \
    zlib1g-dev gawk git gettext libssl-dev xsltproc rsync wget unzip python \
    pkg-config sudo && \
    apt-get clean && \
    useradd builder -s /bin/bash -m && \
    echo "builder ALL=NOPASSWD:ALL" > /etc/sudoers.d/users

USER builder
WORKDIR /home/builder

RUN git config --global user.name ${git_user} && \
    git config --global user.email ${git_mail}

CMD ["bash", "-i"]
