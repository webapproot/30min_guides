#!/bin/bash
#
#
# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
PLAIN='\033[0m'

Limits(){
        cp /etc/security/limits.conf /root/
        echo "* soft nofile 51200" >>/etc/security/limits.conf
        echo "* hard nofile 51200" >>/etc/security/limits.conf
}

###################################################################
Sysctl(){
        mv /etc/sysctl.conf /root/
        wget -O /etc/sysctl.conf https://raw.githubusercontent.com/webapproot/f-/master/sysctl.conf
}
###############################################################
Serverspeeder(){
        wget -N --no-check-certificate https://raw.githubusercontent.com/webapproot/Code_shell/master/serverspeeder-all.sh && bash serverspeeder-all.sh
}
#####################################################################


Bbr(){
        wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
}
######################################################################
Limits
ulimit -n 51200

echo  $GREEN "===========limits.conf ok!================\n"
echo $PLAIN

Sysctl
sysctl -p
#printf  $YELLOW
echo  $YELLOW "===========sysctl ok!================"
echo $PLAIN
echo "#####################################################################"
echo "#####################################################################"
echo "#####################################################################"
Serverspeeder

echo "###############################锐速安装一键包 -ok#################################"
echo "#####################################################################"
echo "#####################################################################"
#wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh

Bbr
chmod +x bbr.sh
./bbr.sh
echo "###############################一键安装最新内核并开启 BBR 脚本 OK #################################"
echo "#####################################################################"
echo "#####################################################################"
