FROM alpine:3.9


#Install Nodejs
RUN apk add --no-cache --update nodejs nodejs-npm	
RUN apt-get install --yes nodejs
RUN node -v
RUN npm -v

RUN npm config set unsafe-perm true
RUN npm install -g http-server
WORKDIR /home/test
RUN echo "hello" > /home/test/index.html

ADD ./.profile.d /app/.profile.d

RUN useradd -m heroku
USER heroku
CMD "http-server" "-s" "-p $PORT" 
