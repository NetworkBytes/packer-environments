#!/usr/bin/env bash

if which subscription-manager 2>/dev/null; then
  echo " - Un-Registering system on the Redhat Network"
  echo " Note - you still need to remove the system from your classic subscription management"
  rm -f /etc/sysconfig/rhn/systemid
else
  echo " - Non RHEL system, skipping registering on the Redhat Network"
fi




