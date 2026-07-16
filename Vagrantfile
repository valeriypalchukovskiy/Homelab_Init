Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
    config.vm.network "public_network"
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
    end
    config.vm.provision "shell", path: "infra/provision.sh"
end