
#base image

FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY . .

#stage 2

FROM node:18-alpine 

WORKDIR /app

COPY --from=builder /app/ /app/

EXPOSE 5173

CMD ["npm", "run","dev"]
