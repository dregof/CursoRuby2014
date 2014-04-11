namespace :nodejs do
  desc "Install the latest relase of Node.js"
  task :install, roles: :app do
    run "#{sudo} add-apt-repository ppa:chris-lea/node.js"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install nodejs"
  end
  after "deploy:install", "nodejs:install"

  desc "Task description"
  task :app, roles: :app do
    run "rm -rf #{shared_path}/node"
    run "cp -R #{release_path}/realtime #{shared_path}/node"
    run "cd #{shared_path}/node; npm install"
    run "killall node 2>/dev/null"
    run "#{shared_path}/node/nohup node app.js > output.log &"
  end
  after "deploy:finalize_update", "nodejs:app"
end
