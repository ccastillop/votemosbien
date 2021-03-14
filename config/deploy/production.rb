set :stage, :production
set :rails_env, 'production'
set :branch, "main"
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
# Default deploy_to directory is /var/www/my_app_name
set :deploy_user, 'ccastillo'
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"
# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths

set :server_name, "votemosbien.com"

#set :nginx_redirect_server_names, "votemosbien.pe votemosbien.info www.votemosbien.com www.votemosbien.info www.votemosbien.pe"
#set :nginx_redirect_ssl_certificate, "/etc/letsencrypt/live/#{fetch(:nginx_redirect_server_names)}/fullchain.pem"
#set :nginx_redirect_ssl_certificate_key, "/etc/letsencrypt/live/#{fetch(:nginx_redirect_server_names)}/privkey.pem"

# set :nginx_use_ssl, true
# set :nginx_ssl_certificate, "/etc/letsencrypt/live/#{fetch(:server_name)}/fullchain.pem"
# set :nginx_ssl_certificate_key, "/etc/letsencrypt/live/#{fetch(:server_name)}/privkey.pem"
# set :nginx_ssl_include_cerbot, true
 
server "#{fetch(:server_name)}",
  user: "#{fetch(:deploy_user)}",
  roles: %w{app db web}

set :puma_threads, [0, 2]
set :puma_workers, 1
set :puma_init_active_record, true
set :puma_preload_app, false

set :backburner_queues, ['default:1', 'mailers:1']