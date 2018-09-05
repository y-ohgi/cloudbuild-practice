FROM node:alpine

WORKDIR /app

COPY . /app

RUN yarn install

ENV STAGE=develop

EXPOSE 3000

CMD ["yarn", "run", "start"]
