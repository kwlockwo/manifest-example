FROM node:10-alpine
RUN apk add --no-cache --update curl bash openssl
# https://github.com/npm/uid-number/issues/3
RUN npm config set unsafe-perm true
RUN npm install -g http-server
WORKDIR /home/test
RUN echo "hello" > /home/test/index.html
CMD "http-server" "-s" "=p $PORT" 
