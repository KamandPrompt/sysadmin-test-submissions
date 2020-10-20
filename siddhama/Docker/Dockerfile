FROM node:7
#In flow of tutorial i forgot to declare new version of node :(
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD node app.js
EXPOSE 3000