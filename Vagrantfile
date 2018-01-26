# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
#VAGRANT_VM_NAME = "launchpad"
#VAGRANT_BOX_URL = ""
#VAGRANT_BOX = "debian/jessie64"
VAGRANT_BOX = "ubuntu/trusty64"
VAGRANT_VM_HOSTNAME = "vagrant.sandbox"
NETWORK_PORT_HTTP = 8081
NETWORK_PORT_MYSQL = 33061
WWW_ROOT = "./mount"
BOOTSTRAP_FOLDER = ".dev"
PROVISIONER_INIT = ".dev/provision/init.sh"
PROVISIONER_UPDATE = ".dev/provision/update.sh"
ACTIVE_PROJECT = "default"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define :launchpad do |launchpad|
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
