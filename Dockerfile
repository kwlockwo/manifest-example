FROM heroku/heroku:16 as build

FROM node:8.11.4

RUN npm config set unsafe-perm true
RUN npm install -g http-server
WORKDIR /home/test
RUN echo "hello" > /home/test/index.html

ADD ./.profile.d /app/.profile.d
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN useradd -m heroku
USER heroku
CMD "http-server" "-s" "-p $PORT" 
