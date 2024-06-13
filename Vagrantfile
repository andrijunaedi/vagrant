require 'yaml'
settings = YAML.load_file(File.join(File.dirname(__FILE__), 'settings.yaml'))

Vagrant.configure("2") do |config|
  config.vm.box = settings['box_name']
  # config.vm.box_version = settings['box_version']
  config.vm.box_check_update = false

  # SSH Config guest SSH port 2222
  # config.ssh.guest_port = 2222

  settings['vm'].each do |vm_config|
    config.vm.define vm_config['name'] do |vm|
      vm.vm.hostname = vm_config['name']
      vm.vm.network "private_network", ip: vm_config['ip']
      vm.vm.synced_folder ".", "/vagrant", disabled: false

      vm.vm.provider "vmware_fusion" do |vb|
        vb.gui = false
        vb.memory = vm_config['memory']
        vb.cpus = vm_config['cpus']
      end

      # vm.vm.provision "shell", inline: <<-SHELL
      #   apt-get update
      #   apt-get upgrade -y
      #   apt-get install -y wget vim net-tools gcc make tar git unzip sysstat tree
      # SHELL

      # Provisioning with a shell script
      vm.vm.provision "shell", path: "scripts/common.sh"

      # Provisioning Nginx and Bind9
      vm.vm.provision "shell", path: "scripts/webserver.sh"
      vm.vm.provision "shell", path: "scripts/dns-server.sh"
      vm.vm.provision "shell", path: "scripts/security.sh"
    end
  end
end