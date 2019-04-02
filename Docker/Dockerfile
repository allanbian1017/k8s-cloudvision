FROM node:8-alpine

RUN apk add --no-cache --virtual .gyp \
    python \
    make \
    g++

RUN mkdir /app/
RUN mkdir /key/

WORKDIR /app/

COPY package.json /app/
COPY index.js /app/

RUN npm install --production

EXPOSE 3000
CMD ["npm", "start"]