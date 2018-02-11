server '192.168.0.99', user: 'wojtek', roles: %w(app db web)
set :branch, "master"
set :docker_dockerfile, "docker/staging/Dockerfile"
