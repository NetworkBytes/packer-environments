#!/usr/bin/env bash

echo " -  Install the VM Tools"

echo " .  Install perl"
yum -y install perl




## Note: requires EPEL repo
echo " .  Install Open VM Tools"
yum install -y open-vm-tools

echo " .  Open VM Tools version installed:"
vmware-toolbox-cmd -v

#TODO: work out if we still need to install deploypkg
#
#cat <<EOM >/etc/yum.repos.d/vmware-tools.repo
#[vmware-tools]
#name = VMware Tools
#baseurl = http://packages.vmware.com/packages/rhel7/x86_64/
#enabled = 1
#gpgcheck = 1
#gpgcheck=0
#EOM
#
## TODO 
#echo "Red Hat Enterprise Linux Server release 7.1 (Maipo)" > /etc/issue
#yum install -y open-vm-tools-deploypkg




# Mount the disk image
#cd /tmp
#mkdir /tmp/isomount
#mount -t iso9660 -o loop /root/linux.iso /tmp/isomount

# Install the drivers
#cp /tmp/isomount/VMwareTools-*.gz /tmp
#tar -zxvf VMwareTools*.gz
#./vmware-tools-distrib/vmware-install.pl -d

# Cleanup
#umount isomount
#rm -rf isomount /root/linux.iso VMwareTools*.gz vmware-tools-distrib
