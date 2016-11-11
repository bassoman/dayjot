FROM bassoman/nodejs
MAINTAINER Jon Lancelle <bassoman@gmail.com>

RUN apt-get update \
  && apt-get install ruby -y
RUN gem install foreman --no-rdoc --no-ri

RUN npm install -g bower
RUN npm install -g ember-cli@2.9.1

# allow bower to run nicely as root user
RUN echo '{ "allow_root": true }' > /root/.bowerrc
