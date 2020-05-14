FROM archlinux

RUN curl "https://blackarch.org/strap.sh" -o /tmp/strap.sh && \
	bash /tmp/strap.sh && \
	rm -f /tmp/strap.sh && \
	pacman -S --noconfirm sudo redis openvas gvmd greenbone-security-assistant nmap && \
	rm -vf "/var/cache/pacman/pkg/*" && \
	echo "db_address = /var/lib/redis/redis.sock" > /etc/openvas/openvassd.conf && \
	awk '!/^#|^$/{print}' /etc/redis.conf > /etc/redis.conf.new && \
	sed -e 's|bind 127.0.0.1|unixsocket /var/lib/redis/redis.sock\nunixsocketperm 700|g' \
	-e 's|port 6379|port 0|g' -e 's|databases 16|databases 128|g' /etc/redis.conf.new > /etc/redis.conf && \
	rm -f /etc/redis.conf.new

COPY --chown=root:root ./run.sh /var/

EXPOSE 9392:9392

CMD bash /var/run.sh

