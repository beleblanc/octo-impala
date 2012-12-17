require "bundler/capistrano"


load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"
load 'deploy/assets'

server "41.215.155.15", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "moj_case_management"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:ZenAnthro/octo-impala.git"
set :branch, "master"

namespace :deploy do
  task :cold do       # Overriding the default deploy:cold
    update
    load_schema       # My own step, replacing migrations.
    start
  end

  task :load_schema, :roles => :app do
    run "cd #{current_path}; rake db:schema:load"
  end
end

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

after "deploy", "deploy:cleanup" # keep only the last 5 releases