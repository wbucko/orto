cron: sh -c "env | sed 's/^/export /' > /root/.bash_profile; /usr/sbin/cron -f"
puma: puma -C config/puma.rb
sidekiq: bundle exec sidekiq --config ./config/sidekiq.yml
