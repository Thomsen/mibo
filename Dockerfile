# mibo dockerfile 0.01
FROM ubuntu:14.04
MAINTAINER thomsen <androidfoross@gmail.com>
RUN apt-get update && apt-get install -y ruby ruby-dev
RUN mkdir /mibo
WORKDIR /mibo

# 0.02
ADD . /mibo
RUN apt-get install -y make g++ libsqlite3-dev
RUN gem install bundle
RUN bundle install
RUN rake db:migrate
