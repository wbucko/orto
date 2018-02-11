set :application, "orto"
set :repo_url, 'git@bitbucket.org:wbucko/orto.git'
set :deploy_to, "/home/wojtek/#{fetch(:application)}"
set :docker_volumes, [
 "#{shared_path}/config/secrets.yml:/app/config/secrets.yml",
 "#{shared_path}/config/database.yml:/app/config/database.yml",
 "#{shared_path}/log:/app/log",
 "#{fetch(:application)}_staging_assets:/app/public/assets"
]
set :docker_links, %w(postgres_ambassador:postgres redis_ambassador:redis)
set :docker_apparmor_profile, "docker-ptrace"
