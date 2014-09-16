require 'bundler/capistrano'

set :application, "app"

#set :scm, :git
#set :repository, "git@github.com:commpeak/servermap.git"
#set :branch, "master"

set :scm, :none
set :repository, '.'

server "server", :app, :web, :db, :primary => true

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :user, "user"
set :deploy_to, "/home/#{user}/#{application}"
set :shared_path, "#{deploy_to}/shared"

set :deploy_via, :copy
set :copy_strategy, :export
set :copy_compression, :bz2
set :use_sudo, false
set :keep_releases, 5
set :normalize_asset_timestamps, false

after "deploy:restart", "deploy:cleanup"

after "deploy:setup" do
  run "touch #{shared_path}/database.yml"
end

after "deploy:finalize_update" do
  run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
end
