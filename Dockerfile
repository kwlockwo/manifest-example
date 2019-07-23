FROM heroku/heroku:18

#Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get install --yes nodejs
RUN node -v
RUN npm -v

RUN npm config set unsafe-perm true
RUN npm install -g http-server
WORKDIR /home/test
RUN echo "hello" > /home/test/index.html

ADD ./.profile.d /app/.profile.d
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN useradd -m heroku
USER heroku
CMD "http-server" "-s" "-p $PORT" 
