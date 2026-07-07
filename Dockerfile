FROM node:22-alpine

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar archivos de dependencias
COPY package*.json ./

# 🚀 USAMOS YARN EN LUGAR DE NPM: Evita el bug del Exit Handler
RUN yarn install

# Copiar el resto del código
COPY index.js .

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación (puedes dejarlo con node index.js)
CMD ["node", "index.js"]