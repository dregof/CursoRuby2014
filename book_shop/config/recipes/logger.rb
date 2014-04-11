namespace :logs do
  desc "Shows full log"
  task :cat do
    run "cat #{deploy_to}/current/log/production.log"
  end
  
  desc "Tails logs with 1000 lines"
  task :tail do
    run "tail -n 1000 -f #{deploy_to}/current/log/production.log"
  end
  
  desc "Shows full log"
  task :dev_cat do
    run "cat #{deploy_to}/current/log/development.log"
  end
  
  desc "Tails logs with 1000 lines"
  task :dev_tail do
    run "tail -n 10000 -f #{deploy_to}/current/log/development.log"
  end
  
end