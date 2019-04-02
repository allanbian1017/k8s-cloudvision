FROM node:8

RUN mkdir /app/
RUN mkdir /key/

COPY package.json /app/
COPY index.js /app/

WORKDIR /app/
RUN npm install --production

EXPOSE 3000
CMD ["npm", "start"]