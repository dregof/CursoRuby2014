
namespace :delayed_job do 
  desc "Restart the delayed_job process"
  task :start, :roles => :app do
      run "cd #{current_path}; script/delayed_job start"
  end
  
  desc "Restart the delayed_job process"
  task :restart, :roles => :app do
      run "cd #{current_path}; script/delayed_job restart"
  end
  
  desc "Restart the delayed_job process"
  task :start_dev, :roles => :app do
      run "cd #{current_path}; rake jobs:work"
  end
end