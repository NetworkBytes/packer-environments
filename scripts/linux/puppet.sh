#!/usr/bin/env bash
#date

#echo " -  Install Puppet Repo"
#echo -n "  . Build version : $(cat /etc/redhat-release)"

#echo " - Install Puppet Agent"
#curl -k https://puppet:8140/packages/current/install.bash | sudo bash


MAJOURVERSION=7
if grep -q ' 6.' /etc/redhat-release; then
  MAJOURVERSION=6
fi


rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-pc1-el-$MAJOURVERSION.noarch.rpm


echo " -  Install Puppet Agent"
yum install -y puppet-agent

# later versions of puppet runs under /opt sandbox, link puppet to a common path
ln -s /opt/puppetlabs/bin/puppet /usr/local/bin/puppet


