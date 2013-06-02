require 'rvm/capistrano'
require 'bundler/capistrano'

server "33.33.33.100", :app, :web, :db, :primary => true

set :default_shell, "/bin/bash -l"
set :rvm_type, :system
set :application, "demo200"
set :user, "vagrant"
set :deploy_to, "/home/vagrant/demo200"
set :deploy_via, :remote_cache
set :scm, :git
set :scm_user, "avamel"
set :repository,  "https://github.com/avamel/demo200.git"
set :branch, "vagrant"

set :ssh_options, {:forward_agent => true, keys: ['~/.vagrant.d/insecure_private_key']} 
set :default_run_options, {:pty => true}

set :use_sudo, false

after "deploy", "deploy:restart"


namespace :deploy do
	task :start do ; end 
	task :stop do ; end
	task :restart, :roles => :app, :except => { :no_release => true } do
		run "touch #{current_path}/tmp/restart.txt}"
    end
end


