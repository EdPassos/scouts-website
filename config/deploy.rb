# config valid only for current version of Capistrano
lock '3.11.0'

set :application, 'scouts-website'
set :repo_url, 'git@github.com:EdPassos/scouts-website.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
#set :deploy_to, '/home/blat-client-app/mainapp'

# Default value for :scm is :git
# set :scm, :git

set :deploy_user, "rails"
set :use_sudo, false
# set :rails_env, "production"
set :deploy_via, :copy
server "5.39.93.8"

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/application.yml', 'config/database.yml', 'config/environments/production.rb')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# setup rvm.
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap
set :tests, []

namespace :deploy do

  after :publishing, :restart do
    on roles(:web), in: :sequence, wait: 5 do
      within release_path do
        execute :rake, 'assets:clean'
        execute :rake, 'assets:precompile'
        execute :touch, 'tmp/restart.txt'
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
      end
    end
  end

end
