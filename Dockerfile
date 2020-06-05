FROM writl/pyload

RUN apt-get update && \
    apt-get clean && apt-get -y update && apt-get install -y locales curl && \
    apt-get install -y wget nano curl openvpn zip unzip bridge-utils && \
    apt-get install nano && \
    mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200 && \
	wget https://raw.githubusercontent.com/KevinEduardo/pyload-privatevpn/master/install.sh && \
	chmod a+x ./install.sh && \
    chmod 600 /dev/net/tun

EXPOSE 8000

CMD ["/run.sh"]