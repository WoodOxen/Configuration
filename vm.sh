apt-get update
apt-get upgrade
apt-get dist-upgrade

snap install qv2ray

apt-get install ssh qemu-guest-agent
systemctl enable ssh
apt-get install vim tmux docker.io net-tools gnome-tweak-tool

docker run -d --name=netdata \
    -p 19999:19999 \
    -v netdataconfig:/etc/netdata \
    -v netdatalib:/var/lib/netdata \
    -v netdatacache:/var/cache/netdata \
    -v /etc/passwd:/host/etc/passwd:ro \
    -v /etc/group:/host/etc/group:ro \
    -v /proc:/host/proc:ro \
    -v /sys:/host/sys:ro \
    -v /etc/os-release:/host/etc/os-release:ro \
    --restart unless-stopped \
    --cap-add SYS_PTRACE \
    --security-opt apparmor=unconfined \
    netdata/netdata

apt-get install nfs-common -y