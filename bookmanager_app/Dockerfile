FROM ruby:2.4.1

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

ENV APP_ROOT /app
ENV RAILS_ENV development

ENV BUNDLE_JOBS 2
ENV BUNDLE_PATH $APP_ROOT/bundle

ENV ENTRYKIT_VERSION 0.4.0

WORKDIR $APP_ROOT

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

ENTRYPOINT [ \
  "prehook",
    "gem update bundler", "--", \
    "bundle install", "--", \
    "if [ -e ./tmp/pids/server.pid ]; then rm ./tmp/pids/server.pid; fi", "--" \
    ]
