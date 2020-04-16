FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
ENV RAILS_ENV openshift
RUN bundle install
ADD . /myapp
RUN chgrp -R 0 /myapp \
  && chmod -R g+rwX /myapp