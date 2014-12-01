# Packer Image Builder for OEL R6 U6 Server

## Introduction

.....

Builds an Oracle Linux 7 Installation for VirtualBox and Vmware (Untested) using packer and vagrant.

Template is based off of https://github.com/opscode/bento/blob/master/packer/centos-7.0-x86_64.json

## Prerequisites

1. Packer - http://packer.io

2. Vagrant - http://vagrantup.com

3. VirtualBox - http://virtualbox.org  (VMWare may work but was not tested)

## Build Instructions

1. Clone the repository

        $ git clone https://github.com/dbehnke/packer-oraclelinux-7.git
        $ cd packer-oraclelinux-7

2. Install the prerequisites, make sure the packer and vagrant commands are in your PATH and callable from Terminal/Command Prompt

3. Place OracleLinux-R7-U0-Server-x86_64-dvd.iso in the iso folder

4. Build the image

        $ packer build -only=virtualbox-iso ol-7.0-x86_64.json

5. Add to vagrant

        $ vagrant box add ol7 oraclelinux-7.0_chef-provisionerless.box

6. Test with vagrant

```
$ mkdir ol7-test
$ cd ol7-test
$ vagrant init ol7
$ vagrant up
$ vagrant ssh
```
```javascript
{
      "name": "oel-6.6",
      "type": "virtualbox-iso",
      "guest_os_type": "Oracle_64",
      ...
      "iso_url": "http://mirrors.dotsrc.org/oracle-linux/OL6/U6/x86_64/OracleLinux-R6-U6-Server-x86_64-dvd.iso"
      "iso_checksum": "5738f10a506d3630edfd297ef179b553091c6a48",
      "iso_checksum_type": "sha1",      
      ...
}
```



