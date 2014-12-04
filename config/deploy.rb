app_name = 'sms-api'

# Ensure that bundle is used for rake tasks
SSHKit.config.command_map[:rake] = "bundle exec rake"

set :application, app_name
set :deploy_to, "/var/www/#{app_name}"
set :keep_releases, 10
set :user, 'ubuntu'
set :stages, ['production']

set :repo_url, 'git@github.com:griffinm/sms-api.git'
set :branch, 'master'

set :ssh_options, {
  keys: %w(~/.ssh/GRIFFINET-PK1.pem),
}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

after "deploy:update_code", "deploy:migrate"
