# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/rbenv'
require 'capistrano/rbenv_install'
require 'capistrano/logrotate'
require 'capistrano/puma'
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require 'capistrano/rails/collection'
require 'capistrano/ssh_doctor'
require 'capistrano/backburner'

install_plugin Capistrano::Puma  # Default puma tasks
install_plugin Capistrano::Puma::Systemd  # if you use SystemD 
install_plugin Capistrano::Puma::Workers  # if you want to control the workers (in cluster mode)
#install_plugin Capistrano::Puma::Jungle # if you need the jungle tasks
install_plugin Capistrano::Puma::Monit  # if you need the monit tasks
install_plugin Capistrano::Puma::Nginx  # if you want to upload a nginx site template
#install_plugin Capistrano::Logrotate

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
