#!/usr/bin/env bash

echo " -  Updating CA Certificates on server"
yum -y install ca-certificates



echo " -  install the Extra Packages for Enterprise Linux repository (EPEL)"
#rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

#TODO - Find a smarter way to determine OS version
MAJOURVERSION=7
if grep -q ' 6.' /etc/redhat-release; then
  MAJOURVERSION=6
fi


cat <<EOM >/etc/yum.repos.d/epel-bootstrap.repo
[epel]
name=Bootstrap EPEL
#mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-\$releasever&arch=\$basearch
mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$MAJOURVERSION&arch=\$basearch
failovermethod=priority
enabled=0
gpgcheck=0
EOM


yum --enablerepo=epel -y install epel-release
rm -f /etc/yum.repos.d/epel-bootstrap.repo