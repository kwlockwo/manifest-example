FROM heroku/heroku:16 as build

ADD ./.profile.d /app/.profile.d
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

FROM node:8.11.4

RUN npm config set unsafe-perm true
RUN npm install -g http-server
WORKDIR /home/test
RUN echo "'sup bro" > /home/test/index.html

RUN useradd -m heroku
USER heroku
CMD "http-server" "-s" "-p $PORT" 
