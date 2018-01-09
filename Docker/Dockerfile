FROM node:latest

RUN mkdir /app/
RUN mkdir /key/

WORKDIR /app/

COPY package.json /app/
COPY index.js /app/
RUN npm install

EXPOSE 3000
CMD ["npm", "start"]