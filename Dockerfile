FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY . .

EXPOSE 3000

ENV NODE_ENV=production

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

USER appuser

CMD ["npm", "start"]