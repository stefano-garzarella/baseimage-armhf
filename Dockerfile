FROM phusion/baseimage:0.10.0

LABEL maintainer="dlandon"

ENV	DEBCONF_NONINTERACTIVE_SEEN="true" \
	DEBIAN_FRONTEND="noninteractive" \
	DISABLE_SSH="true" \
	HOME="/root" \
	LC_ALL="C.UTF-8" \
	LANG="en_US.UTF-8" \
	LANGUAGE="en_US.UTF-8" \
	TZ="Etc/UTC" \
	TERM="xterm"

COPY init/ /etc/my_init.d/

RUN	apt-get update && \
	apt-get -y dist-upgrade -o Dpkg::Options::="--force-confold" && \
	apt-get -y clean && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN chmod +x /etc/my_init.d/*.sh

CMD ["/sbin/my_init"]
