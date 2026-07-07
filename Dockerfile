# Dockerfile
FROM node:20-slim

WORKDIR /usr/src/app

# Habilitar yarn (viene incluido con corepack en node 20)
RUN corepack enable

COPY package*.json ./

# Instalar dependencias con yarn en vez de npm
RUN yarn install && ls -la node_modules/express

COPY index.js .

EXPOSE 3000

CMD ["node", "index.js"]