server "192.168.33.10", :app, :web, :db, :primary => true

set :application, "demo200"
set :user, "vagrant"
set :deploy_to, "/home/vagrant/demo200"

set :scm, :git
set :repository,  "https://github.com/avamel/demo200.git"

set :ssh_options, {:forward_agent => true, keys: ['~/.vagrant.d/insecure_private_key']} 
set :default_run_options, {:pty => true}
set :stages, ["vagrant"]
set :default_stage, "vagrant"
set :use_sudo, false



