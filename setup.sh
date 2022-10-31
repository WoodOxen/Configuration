# /bin/bash
export USER_ID=1000 # don't revise the ID unless you have more than one user in one docker

sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt-get update

# setup user
apt-get install -y sudo
useradd -l -u ${USER_ID} -G sudo -md /home/${USER_NAME} -s /bin/bash -p ${USER_NAME} ${USER_NAME}
adduser ${USER_NAME} sudo

# setup ssh
apt-get install -y openssh-server xauth xorg
mkdir /var/run/sshd
ssh-keygen -A
cp /mnt/pool2/setup/configs/sshd_config /etc/ssh/sshd_config

# configure the DNS
cp /mnt/pool2/setup/configs/resolv.conf /etc/resolv.conf

# some other recommended tools
apt-get install -y snapd
apt-get install -y net-tools nmap
apt-get install -y curl wget git
apt-get install -y pciutils
apt-get install -y vim nano gedit tmux

#clean
apt-get upgrade -y
apt-get clean

# start ssh
service ssh start
service ssh status