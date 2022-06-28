# -*- mode: ruby -*-
# vi: set ft=ruby :

require "pathname"

vm_spec_arr = [
  {
    name: "vagrant0",
    cpu: 4,
    memory: 4096,
    box: "ubuntu/jammy64",  # ubuntu 22.04
  },
  {
    name: "vagrant1",
    cpu: 4,
    memory: 4096,
    box: "ubuntu/focal64",  # ubuntu 20.04
  },
]

Vagrant.configure("2") do |config|
  vm_spec_arr.each do |spec|
    config.vm.define spec[:name] do |v|
      v.vm.box = spec[:box]
      v.vm.hostname = spec[:name]
      v.vm.provider "virtualbox" do |vbox|
        vbox.gui = false
        vbox.cpus = spec[:cpu]
        vbox.memory = spec[:memory]
      end
      v.vm.synced_folder ".",
                         "/vagrant",
                         owner: "vagrant",
                         group: "vagrant",
                         mount_options: [
                           "dmode=700",
                           "fmode=700",
                         ]

      config.vm.provision "shell",
                          inline: <<-SHELL
        apt update -y
        apt install -y python3 python3-pip
      SHELL
      config.vm.provision "shell",
                          privileged: false,
                          inline: <<-SHELL
        id
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
        python3 -m pip install --upgrade pip
        python3 -m pip install ansible
        python3 -m pip install -r /vagrant/requirements.txt
      SHELL

      v.vm.provision "ansible_local" do |ansible|
        playbook_dirpath = Pathname.new(".").join("playbooks")
        # ansible.playbook = playbook_dirpath.join("debug.yml")
        ansible.playbook = playbook_dirpath.join("setup.yml")
        ansible.inventory_path = playbook_dirpath.join("inventory").join("vagrant.yml")
        # ansible.inventory_path = playbook_dirpath.join("inventory").join("vagrant.py")
        # ansible.install = true
        ansible.limit = spec[:name]
      end
    end
  end
end
