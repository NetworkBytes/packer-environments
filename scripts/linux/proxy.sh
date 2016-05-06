#!/usr/bin/env bash

echo "Not adding a proxy"
exit

file=/etc/profile.d/proxy.sh
proxy=proxy:3128

echo " - Configure proxy for yum"
echo proxy=http://$proxy >> /etc/yum.conf


echo " - Configure proxy for environment"
cat << EOF > $file

# Global Proxy - generated by packer
export http_proxy=http://$proxy
export https_proxy=https://$proxy
export no_proxy="127.0.0.1, localhost, management"

EOF




