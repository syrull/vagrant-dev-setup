# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # ---------------------------------------------------------------------------
  # VB Settings
  # ---------------------------------------------------------------------------
  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = true
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end


  # ---------------------------------------------------------------------------
  # Ports
  # ---------------------------------------------------------------------------
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # ---------------------------------------------------------------------------
  # Shared Data
  # ---------------------------------------------------------------------------
  config.vm.synced_folder "./code", "/code"

  # View the documentation for the provider you are using for more
  # information on available options.

  # ---------------------------------------------------------------------------
  # Setup
  # ---------------------------------------------------------------------------
  config.vm.provision :shell, :path => "provision.sh"
end
