## RC FILES 
# SYSTEM GLOBAL
if [ -f /etc/bashrc ]; 
then
	. /etc/bashrc
fi

# DEFAULT WITH MODIFICATIONS
if [ -f /home/vagrant/etc/bash/.bashrc.default ]; 
then
	. /home/vagrant/etc/bash/.bashrc.default
fi


## ALIASES AND FUNCTIONS
# FOR WEB SERVER
if [ -f /home/vagrant/etc/bash/.bash_aliases.web ]; 
then
	. /home/vagrant/etc/bash/.bash_aliases.web
fi

# FOR MAGENTO2
if [ -f /home/vagrant/etc/.MAGENTO2_PROJECT ]; 
then
    . /home/vagrant/etc/bash/.bash_aliases.magento2
fi


## PROGRAM BIN FOLDERS
# FOR NPM
if [ -d "/home/vagrant/nodjes/bin" ] ; then
  PATH="/home/vagrant/nodejs/bin:$PATH"
fi

# FOR USER 
if [ -d "/home/vagrant/bin" ] ; then
  PATH="/home/vagrant/bin:$PATH"
fi
