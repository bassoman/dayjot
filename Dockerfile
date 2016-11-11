FROM bassoman/nodejs
MAINTAINER Jon Lancelle <bassoman@gmail.com>

#RUN npm install ember-cli@0.1.4 bower
RUN npm install bower

RUN npm install ember-cli@2.9.1

RUN apt-get install ruby -y

RUN gem install foreman --no-rdoc --no-ri
