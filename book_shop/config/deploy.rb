require "bundler/capistrano"
#require "delayed/recipes"

load "config/recipes/base"
load "config/recipes/apache"
load "config/recipes/logger"
load "config/recipes/check"
load "config/recipes/rbenv"
load "config/recipes/nodejs"
load "config/recipes/mysql"
load "config/recipes/system"
#load "config/recipes/delayed_job"
load "config/recipes/monit"


set :scm, "git"
set :repository, "git@github.com:softwhisper/SoftwhisperV2.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]

set :application, "beta.softwhisper.es"
set :use_sudo, false

desc "Gigas Server"
task :development do
  server "IP", :web, :app, :db, primary: true
  set :user, "deployer"
  set :deploy_to, "/home/#{user}/apps/#{application}"
  set :rails_env, "development"
  set :branch, "develop"
end

desc "Rackspace"
task :prod_master do
  set :port, 6789
  set :user, "deployer"
  set :deploy_to, "/home/#{user}/apps/#{application}"
  set :rails_env, "production"
  role :app, "IP"
  role :web, "IP"
  role :db, "IP", primary: true
end

after "deploy", "sym:links"       # make carrierwave uploads sym links
after "deploy", "deploy:cleanup"  # keep only the last 5 releases

require './config/boot'
