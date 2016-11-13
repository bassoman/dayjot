FROM ruby:2.2.0
MAINTAINER Jon Lancelle <bassoman@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && apt-get clean

RUN gem install foreman --no-rdoc --no-ri

RUN npm install -g bower minimatch
RUN npm install -g ember-cli@2.9.1

# allow bower to run nicely as root user
RUN echo '{ "allow_root": true }' > /root/.bowerrc

RUN useradd -ms /bin/bash app
RUN chown -R app:app .
USER app

ENV GEM_HOME /home/app/.gems
#RUN gem install bundler
#RUN bundle


