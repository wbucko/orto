server '192.168.0.99', user: 'wojtek', roles: %w(app db web)
set :branch, "master"
set :docker_dockerfile, "docker/staging/Dockerfile"

set :docker_compose, -> { true }

## Following line contains a list of files that should be inside the container which are not in repository (like secrets.yml, sec_config.yml or other files)
## Uncomment this line and adjust the list of required files
## Remember to put these files inside /home/deploy/apps/APPLICATION/integration/shared directory!
# set :docker_copy_data, %w(config/secrets.yml)

## By design, dynamic staging require database setup / seeds and other tasks in order to start up properly
## In order to "prepeare" dynamic staging uncomment following lines and add a bin/integration-before-start script in your project
## Example integration-before-start file can be found in this very document, a little bit below
before 'docker:deploy:compose:start', 'before_start' do
  on roles(fetch(:docker_role)) do
    within release_path do
      execute :"docker-compose", compose_run_command("web", "bin/integration-before-start")
    end
  end
end
