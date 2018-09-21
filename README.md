# Project-Launchpad

Multi project vagrant setup and provisioning tool for fast project startup 

## Features



### Prerequisites
- Virtualbox
- Vagrant 

### Install

Set preferences in the `Vagrantfile` header

```
# Name your box
# *currently not able to pass as variable - set at 'config.vm.define'
#VAGRANT_VM_NAME = "project_launchpad"

# choose vagrant box - debian/jessie64 (default) | ubuntu/trusty64 |centos/7
VAGRANT_BOX = "debian/jessie64" 

# Machines hostname 
VAGRANT_VM_HOSTNAME = "vagrant_sandbox"

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
```

Start and provision machine

`vagrant up`

## Usage


__Structure__

```
├── .dev
│   ├── lib
│   └── scripts
├── mount
│   └── PROJECT_FOLDERS_GO_HERE
├── README.template.md
└── Vagrantfile
```

`/mount` 

This folder contains project level folders. During setup a folder name can be passed to vagrant to create a virtualhost file, easily allowing for project switching or multi purpose virtual machines. 

`/.dev` 

This folder is mounted to the vagrant user home directory and contains useful scripts and aliases that can provision the machine or used to create backup or shortcuts during development.


## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License

[MIT](https://choosealicense.com/licenses/mit/)
