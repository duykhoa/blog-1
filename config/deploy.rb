require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :domain, ''
set :deploy_to, '/home/deploy/sara'
set :repository, 'https://github.com/duykhoa/blog-1.git'
set :branch, 'cap'
set :rvm_path, '/usr/local/rvm/scripts/rvm'

set :shared_paths, ['config/database.yml', 'config/application.yml', 'config/secrets.yml']

set :user, 'deploy'    # Username in the server to SSH to.
set :port, '22 -A'     # SSH port number.
set :forward_agent, true     # SSH forward_agent.
#set :bash_options, '-i'

task :environment do
  invoke :'rvm:use[2.1.0@blog]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  to :before_hook do
  end

  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
    end
  end
end
