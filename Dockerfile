FROM alpine:3.8

#Install Nodejs
RUN apk add --no-cache --update bash nodejs nodejs-npm
RUN node -v
RUN npm -v

RUN npm config set unsafe-perm true
RUN npm install -g http-server
WORKDIR /home/test
RUN echo "hello" > /home/test/index.html

ADD ./.profile.d /app/.profile.d
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN adduser -D heroku
USER heroku
CMD "http-server" "-s" "-p $PORT" 
