#!/bin/bash

# Get what yum will need for Node.js install.
curl --silent --location https://rpm.nodesource.com/setup | bash -
# Update CentOS with any patches
yum update -y --exclude-kernel
# Tools
yum install -y nano vim git unzip screen nc telnet nodejs
