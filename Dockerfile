FROM ruby:3.0.2-alpine

RUN apk add --update --no-cache \
    build-base \
    postgresql-client \
    postgresql-dev \
    tzdata \
    curl

ENV LC_ALL en_US.UTF-8
ARG LOCAL_TIME=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$LOCAL_TIME \
  /etc/localtime

ARG APP_PATH=/opt/app/
WORKDIR $APP_PATH

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
# Install gems
RUN export BUNDLER_VERSION=$(awk '/BUNDLED WITH/ { getline ; print $1 }' Gemfile.lock) \
  && gem install bundler --version $BUNDLER_VERSION \
  && bundle install \
  && bundle config --global frozen 1 \
  && bundle install -j4 --retry 3 \
  # Remove unneeded files (cached *.gem, *.o, *.c)
  && rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

# Add the app
COPY . $APP_PATH
