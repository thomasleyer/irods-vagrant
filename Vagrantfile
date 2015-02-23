# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "centos_6_x86_64_minimal_4.1.12"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.vm.host_name = "irods"
  config.vm.network :hostonly, "10.1.1.10"
  config.vm.customize [ 'modifyvm', :id , '--memory', 256 ]
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'init.pp'
    puppet.module_path = 'modules'
  end
end
