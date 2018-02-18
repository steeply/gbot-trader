# vim:set ft=dockerfile:
FROM node:alpine

LABEL maintainer="ak@ctiapps.pro"

WORKDIR /bot
ADD . /bot/

RUN npm install

CMD ["node", "./build/server.js"]
