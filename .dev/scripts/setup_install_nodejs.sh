#!/bin/bash
## echo $SHELL if unknown

## HOW TO INSTALL 
# https://www.a2hosting.com/kb/installable-applications/manual-installations/installing-node-js-on-managed-hosting-accounts
## LEGACY NODEJS 9.0
# wget https://nodejs.org/dist/v9.2.0/node-v9.2.0-linux-x64.tar.xz

NPM_VERSION=${1:-"STABLE"}

mkdir /home/vagrant/nodejs 
mkdir /home/vagrant/nodejs_temp 
cd /home/vagrant/nodejs_temp 


if [ "$NPM_VERSION" = "STABLE" ] 
then
  wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.xz
  tar -xJf node-v8.9.4-linux-x64.tar.gz
  mv node-v8.9.4-linux-x64/* /home/vagrant/nodejs
else 
  wget https://nodejs.org/dist/v9.4.0/node-v9.4.0-linux-x64.tar.xz
  tar -xJf node-v9.4.0-linux-x64.tar.gz
  mv node-v9.4.0-linux-x64/* /home/vagrant/nodejs
fi  
  
cd /home/vagrant/nodejs 
rm -rf /home/vagrant/nodejs_temp   
