#!/bin/bash

# Update CentOS with any patches
yum update -y --exclude-kernel
# Tools
yum install -y nano vim git unzip screen nc telnet nodejs
