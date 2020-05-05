FROM alpine

RUN apk add --no-cache redis && rm -f /etc/redis.conf

COPY --chown=root:root ./redis.conf /etc/

ENV HOME /var/lib/redis

WORKDIR ${HOME}

USER redis

EXPOSE 6379

CMD /usr/bin/redis-server /etc/redis.conf
