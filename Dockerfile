FROM ruby:2.1.4
MAINTAINER Jon Lancelle <bassoman@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential sudo

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && apt-get clean

RUN gem install foreman --no-rdoc --no-ri

#RUN mkdir /app
#WORKDIR /app
#ADD . /app

#RUN useradd -ms /bin/bash rails
#RUN chown -R rails:rails .

# turn off -g
RUN npm install -g bower minimatch
RUN npm install -g ember-cli@2.9.1

# allow bower to run nicely as root user
RUN echo '{ "allow_root": true }' > /root/.bowerrc

# make bundle behave!
RUN bundle config --global silence_root_warning 1

#USER rails

#ENV GEM_HOME /home/rails/.gems
#RUN gem install bundler
#RUN bundle
