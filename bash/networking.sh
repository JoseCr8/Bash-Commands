#!/bin/bash
#--------------------------------------
#------ Bash networking commands ------
#--------------------------------------

# Nmcli, other way of seeing the network information
nmcli c
nmcli d

# Get IP and mask of one interface using ifconfig
BROADCAST_IP=$(/sbin/ifconfig eth0 | grep 'Bcast:' | cut -d: -f3 | awk '{ print $1}')
BROADCAST_MASK=$(/sbin/ifconfig eth0 | grep 'Mask:' | cut -d: -f4 | awk '{ print $1}')

# Allow broadcast messages and forwarding (usefull when working with discovery messages)
# Alpine
sudo sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=0
echo '# Disable the setting to ignore echo broadcasts' | sudo tee /etc/sysctl.d/00-alpine.conf
echo 'net.ipv4.icmp_echo_ignore_broadcasts=0' | sudo tee -a /etc/sysctl.d/00-alpine.conf

sudo sysctl -w net.ipv4.conf.all.bc_forwarding=1
echo '# Enabling broadcast forwarding for "all" interfaces' | sudo tee -a /etc/sysctl.d/00-alpine.conf
echo 'net.ipv4.conf.all.bc_forwarding=1' | sudo tee -a /etc/sysctl.d/00-alpine.conf