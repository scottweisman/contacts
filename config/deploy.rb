require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

server "192.34.63.11", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "contacts"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:scottweisman/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

###
require 'capistrano-db-tasks'

# if you haven't already specified
# set :rails_env, "production"

# if you want to remove the dump file after loading
set :db_local_clean, true

# If you want to import assets, you can change default asset dir (default = system)
# This directory must be in your shared directory on the server
# set :assets_dir, %w(public/assets public/att)

# if you want to work on a specific local environment (default = ENV['RAILS_ENV'] || 'development')
# set :locals_rails_env, "production"