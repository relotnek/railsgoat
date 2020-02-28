FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /railsgoat
WORKDIR /railsgoat
ADD Gemfile /railsgoat/Gemfile
ADD Gemfile.lock /railsgoat/Gemfile.lock
RUN bundle install
ADD . /railsgoat
