#!/usr/bin/env bash

# TODO - hide the password

RHN_USER=
RHN_PASS=

if which subscription-manager 2>/dev/null; then
  #echo " - Registering on the Redhat Network"
  #subscription-manager register \
  #  --username $RHN_USER \
  #  --password $RHN_PASS \
  #  --auto-attach \
  #  --force

# use local repo instead of the RHN
cat <<EOM >/etc/yum.repos.d/redhat-local.repo
[rhel-7-server-rpms-local]
metadata_expire = 86400
baseurl = http://satellite.management/yum-snapshots/RHEL7Server-x86_64/latest/rhel-7-server-rpms/
#ui_repoid_vars = releasever basearch
name = Red Hat Enterprise Linux 7 Server (RPMs) (Local Satellite1-1 Cache)
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
enabled = 1
gpgcheck = 1
EOM

#echo latest > /etc/yum/vars/repostream

else
  echo " - Non RHEL system, skipping registering on the Redhat Network"
fi