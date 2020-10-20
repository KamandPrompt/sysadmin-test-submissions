

FROM node               

ENV NODE_VERSION 6.9.4

WORKDIR /home/baat-cheet

COPY package*.json ./          

RUN npm install

COPY ./ ./              

EXPOSE 3000

ENTRYPOINT ["npm", "start"]
