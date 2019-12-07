# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/disco64' # 19.04
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  config.vm.provision :shell,
   inline: "sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime",
   run: "always"

  config.vm.provider 'virtualbox' do |v|
    v.memory = ENV.fetch('RAILS_DEV_BOX_RAM', 2048).to_i
    v.cpus   = ENV.fetch('RAILS_DEV_BOX_CPUS', 2).to_i
    v.customize ["guestproperty", "set", :id, "--timesync-threshold", 5000]
  end
end