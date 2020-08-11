FROM node:12.13.0-alpine3.10 AS builder

WORKDIR /app

COPY . .

RUN npm install --save

FROM node:12.13.0-alpine3.10

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD npm start