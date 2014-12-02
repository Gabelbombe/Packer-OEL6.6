#!/bin/bash -eux

## These were only needed for building VMware/Virtualbox extensions:
yum -y remove gcc cpp kernel-devel kernel-headers perl
yum -y clean all

rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?
rm -f /tmp/puppet*rpm

## clean up redhat interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules
[ -r /etc/sysconfig/network-scripts/ifcfg-eth0 ] && {
  sed -i -e 's/^HWADDR.*$//' \
  		 -e 's/^UUID.*$//'   /etc/sysconfig/network-scripts/ifcfg-eth0
}