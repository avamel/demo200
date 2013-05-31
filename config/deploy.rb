

server "33.33.33.100", :app, :web, :db, :primary => true

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

after "deploy", "deploy:cleanup"

namespace :deploy do
	task :restart, roles: :app do
		run "toch #{current_path}/tmp/restart.txt"
	end

	task :symlink_config, roles: :app do
		run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
	end
	after "deploy:finalize_update", "deploy:symlink_config" 
end




