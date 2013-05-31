require 'bundler/capistrano'

server "33.33.33.100", :app, :web, :db, :primary => true

set :application, "demo200"
set :user, "vagrant"
set :deploy_to, "/home/vagrant/demo200"

set :scm, :git
set :scm_user, "avamel"
set :repository,  "https://github.com/avamel/demo200.git"
set :branch, "vagrant"

set :ssh_options, {:forward_agent => true, keys: ['~/.vagrant.d/insecure_private_key']} 
set :default_run_options, {:pty => true}

set :use_sudo, false

namespace :deploy do
  desc <<-DESC
   
  DESC
  task :default do
    update
    restart
  end
end





