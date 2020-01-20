FROM ruby:2.6.3
LABEL maintainer="daiphamblog"
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libxslt-dev libxml2-dev libpq-dev
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install --without development test
COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
