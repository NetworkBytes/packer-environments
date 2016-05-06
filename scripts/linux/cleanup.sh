#!/usr/bin/env bash

if type apt-get >/dev/null 2>&1; then
  echo " - Cleaning up apt cache"
  apt-get clean
fi

if type yum >/dev/null 2>&1; then
  echo " - Cleaning up yum cache"
  yum clean all
fi



#rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo
rm -rf linux.iso

echo " - Remove traces of mac address from network configuration"
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-*
sed -i /UUID/d /etc/sysconfig/network-scripts/ifcfg-*
rm -f /etc/udev/rules.d/70-persistent-net.rules

echo " - Removing Server SSH host keys"
rm -f /etc/ssh/ssh_host_* 

echo " - Removing proxy settings"
rm -f /etc/profile.d/proxy.sh


sync

