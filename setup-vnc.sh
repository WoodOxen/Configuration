
# /bin/bash
export USER_ID=1000 # don't revise the ID unless you have more than one user in one docker

sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt-get update

# setup user
apt-get install -y sudo
useradd -l -u ${USER_ID} -G sudo -md /home/${USER_NAME} -s /bin/bash -p ${USER_NAME} ${USER_NAME}
adduser ${USER_NAME} sudo

# install and setup ssh
apt-get install -y openssh-server xauth xorg
mkdir /var/run/sshd
ssh-keygen -A
cp /mnt/pool2/setup/configs/sshd_config /etc/ssh/sshd_config

# install desktop environment
apt-get install -y apt-utils dialog
apt-get install -y xfce4 xfce4-goodies dbus-x11 x11-xserver-utils
# install vnc
apt-get install -y tigervnc-standalone-server tigervnc-common

# configure the DNS
cp /mnt/pool2/setup/configs/resolv.conf /etc/resolv.conf

# some other recommended tools
apt-get install -y snapd
apt-get install -y net-tools nmap
apt-get install -y curl wget git
apt-get install -y pciutils
apt-get install -y vim nano gedit tmux

#clean
apt upgrade -y
apt clean

# start services
service ssh start
service ssh status
service dbus start
service dbus status