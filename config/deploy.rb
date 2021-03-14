# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "votemosbien"
set :repo_url, "git@github.com:softwarebajodemanda/votemosbien.git"

# config/deploy.rb
set :rbenv_type, :user # or :system, or :fullstaq (for Fullstaq Ruby), depends on your rbenv setup
#set :rbenv_path, "~/.rbenv"
#set :rbenv_path, "/home/ccastillo/.rbenv"
# set :rbenv_custom_path, "/home/#{fetch(:deploy_user)}/.rbenv"

# in case you want to set ruby version from the file:
set :rbenv_ruby, File.read('.ruby-version').strip # default

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# set nginx server real name
set :nginx_server_name, ->{ fetch(:server_name) }

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids',
  'tmp/cache', 'tmp/sockets', 'vendor/bundle',
  'public/system', 'public/uploads',
  ".bundle", "node_modules",
  'storage')

#"public/packs", ??

set :backburner_queues, ['default','mailer']

set :ssh_options, { forward_agent: true }

append :linked_files, "config/master.key"
namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end
end

before "deploy:assets:precompile", "deploy:yarn_install"
namespace :deploy do
  desc "Run rake yarn install"
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install --silent --no-progress --no-audit --no-optional")
      end
    end
  end
end