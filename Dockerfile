FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache dumb-init

# Install with --build-from-source to force recompilation
COPY package*.json ./

RUN npm install --legacy-peer-deps --build-from-source || npm install --legacy-peer-deps

COPY . .

EXPOSE 8080

ENTRYPOINT ["dumb-init", "--"]

CMD ["npm", "run", "dev"]