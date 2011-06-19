Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.define :chef_server do |chef_server_config|
    chef_server_config.vm.box = "vagrant-sid-amd64-rvm-06-18-2011-661e8f"
    chef_server_config.vm.box_url = "http://www.zeddworks.com/vagrant-sid-amd64-rvm-06-18-2011-661e8f.box"

    chef_server_config.vm.forward_port("chef-server", 4000, 4000, :auto => true)
    chef_server_config.vm.forward_port("chef-webui", 4040, 4040, :auto => true)
    chef_server_config.vm.forward_port("apt-proxy", 3142, 3142, :auto => true)

    chef_server_config.vm.customize do |vm|
      vm.memory_size = 1024
    end

    chef_server_config.vm.network "33.33.33.100"

    #chef_server_config.vm.share_folder "v-data", "/vagrant_data", "data"

    chef_server_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.roles_path = "roles"
      chef.add_role "debian-chef-server"
    end
  end

  config.vm.define :chef_client do |chef_client_config|
    chef_client_config.vm.box = "vagrant-sid-amd64-rvm-06-18-2011-661e8f"
    chef_client_config.vm.box_url = "http://www.zeddworks.com/vagrant-sid-amd64-rvm-06-18-2011-661e8f.box"

    chef_client_config.vm.forward_port "web", 3000, 8080, :auto => true

    chef_client_config.vm.customize do |vm|
      vm.memory_size = 2048
    end

    chef_client_config.vm.network "33.33.33.10"

    #chef_client_config.vm.share_folder "v-data", "/vagrant_data", "data"

    chef_client_config.vm.provision :chef_server do |chef|
      chef.node_name = "chef_client"
      chef.chef_server_url = "http://33.33.33.100:4000"
      chef.validation_key_path = "#{ENV['HOME']}/.chef/validation.pem"
    end
  end

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  # config.vm.network "33.33.33.10"


  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file vagrant-natty-amd64-ruby-05-19-2011.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "vagrant-natty-amd64-ruby-05-19-2011.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "cookbooks"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json.merge!({ :mysql_password => "foo" })
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_server do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # IF you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
