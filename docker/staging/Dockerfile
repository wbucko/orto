FROM quay.io/netguru/ng-ruby:2.4.0-rails-onbuild
ENV PUMA_WORKER_COUNT 2
ENV PUMA_THREAD_COUNT 2

ENV APP_ENV staging
ENV RAILS_ENV staging

ENV REDIS_URL=redis://redis:6379/0
ENV RAILS_SERVE_STATIC_FILES 1

ENV VIRTUAL_HOST orto.com
EXPOSE 3000

RUN mkdir -p /app/tmp/pids

CMD ["dumb-init", "forego", "start", "-r"]
