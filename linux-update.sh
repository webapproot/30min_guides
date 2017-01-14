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


Sysctl(){
        mv /etc/sysctl.conf /root/
        wget -O /etc/sysctl.conf https://raw.githubusercontent.com/webapproot/f-/master/sysctl.conf
}


Limits
ulimit -n 51200

echo  $GREEN "===========limits.conf ok!================\n"
echo $PLAIN

Sysctl
sysctl -p
#printf  $YELLOW
echo  $YELLOW "===========sysctl ok!================"
echo $PLAIN
