set :application, "dinnerbywayoflunch"

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:nethermead/dinnerlunch_monster.git"  # Your clone URL
set :scm, "git"
set :user, "zaynabtv"  # The server's user for deploys
set :scm_passphrase, "Aisha2053*"  # The deploy user's password
set :branch, "master"
set :scm_verbose, true
set :deploy_via, :copy

set :deploy_to, "/home/zaynabtv/rails_apps/#{application}"

set :use_sudo, false

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# It's a single server, so let's not risk typos for web/app/db
set :location, "#{application}.com"

role :web, "#{location}"                          # Your HTTP server, Apache/etc
role :app, "#{location}"                          # This may be the same as your `Web` server
role :db,  "#{location}", :primary => true       # This is where Rails migrations will run

namespace :deploy do
  task  :symlink_shared  do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task  :restart  do
    run "cd #{current_path} && sudo mongrel_rails restart"
  end
end




# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end