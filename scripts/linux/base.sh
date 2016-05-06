#!/usr/bin/env bash

echo " - Updating System, yum update "
yum -y update

echo " - Installing common base packages"
yum -y install \
  cifs-utils \
  bash-completion \
  wget \
  traceroute \
  tmpwatch \
  vim-enhanced \
  policycoreutils-python \
  rsync \
  crontabs \
  logwatch \
  bind-utils \
  unzip \
  telnet \
  sysstat \
  cyrus-sasl \
  openssh-clients \
  pciutils \
  ca-certificates


# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
