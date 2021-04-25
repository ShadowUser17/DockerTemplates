1) docker build -t openwrt-builder --build-arg git_user='user' --build-arg git_mail='user@example.com' .
2) docker run --rm --name openwrt -v "/usr/src/openwrt:/home/builder" -it openwrt-builder:latest
3) ./scripts/feeds update -a && ./scripts/feeds install -a
4) make menuconfig
5) make
