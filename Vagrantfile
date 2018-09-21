# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

# choose vagrant box - debian/jessie64 (default) | ubuntu/trusty64 | centos/7
#VAGRANT_BOX_URL = ""
VAGRANT_BOX = "debian/jessie64" 

# Name you box 
#VAGRANT_VM_NAME = "project_launchpad"
VAGRANT_VM_HOSTNAME = "project_launchpad"

# Set ports for mapping 
NETWORK_PORT_HTTP = 8081
NETWORK_PORT_MYSQL = 33061

# Default mount point for /var/www/ 
WWW_ROOT = "./mount"

# Aliases and scripts for development 
BOOTSTRAP_FOLDER = ".dev"

# Machine inital provisioner script
PROVISIONER_INIT = ".dev/provision/init.sh"

# Provisioner script to run on update 
PROVISIONER_UPDATE = ".dev/provision/update.sh"

# Folder inside the mount directory to serve on provisioning 
ACTIVE_PROJECT = "default"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define :project_launchpad do |project_launchpad|
    end

    config.vm.post_up_message = "SUCCESS"

    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "1024"
      vb.cores = 2
    end

    config.vm.box = VAGRANT_BOX
    #config.vm.box_url = VAGRANT_BOX_URL
    config.vm.hostname = VAGRANT_VM_HOSTNAME

    # PRIVATE NETWORK REQUIRED FOR NFS STORAGE MODE
    # config.vm.network "private_network", ip: "192.168.33.10"

    config.vm.network :forwarded_port, host: NETWORK_PORT_HTTP, guest: 80
    config.vm.network :forwarded_port, host: NETWORK_PORT_MYSQL, guest: 3306

    config.vm.synced_folder WWW_ROOT, "/var/www", 
      owner: "vagrant", 
      group: "vagrant", 
      mount_options: ["dmode=777", "fmode=777"]

    config.vm.synced_folder BOOTSTRAP_FOLDER, "/home/vagrant/etc",
      owner: "vagrant", 
      group: "vagrant", 
      mount_options: ["dmode=777", "fmode=777"]

    # PROVISIONERS
    config.vm.provision "shell",
      name: "init",
      path: PROVISIONER_INIT,
      args: ACTIVE_PROJECT,
      run: "once"

    # RUN WITH 
    # vagrant provision --provision-with update
    config.vm.provision "shell", 
      name: "update",
      path: PROVISIONER_UPDATE,
      args: ACTIVE_PROJECT,
      run: "never"

end
