FROM node:10

ARG REDIS_HOST
ARG REDIS_PORT

ENV REDIS_HOST ${REDIS_HOST:-'redis'}
ENV REDIS_PORT ${REDIS_PORT:-'6379'}

ADD package.json .

RUN npm install

ADD . .

RUN npm config set mockbin:redis redis://${REDIS_HOST}:${REDIS_PORT}
EXPOSE 8080

CMD ["npm", "start"]