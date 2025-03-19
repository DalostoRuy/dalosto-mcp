FROM n8nio/n8n:latest

USER root

# Instala dependências do sistema (verifique se sua imagem é baseada em Alpine ou Debian)
RUN apk update && apk add --no-cache chromium libc6-compat git

# Define a variável de cache para Puppeteer e cria o diretório
ENV PUPPETEER_CACHE_DIR=/tmp/puppeteer-cache
RUN mkdir -p /tmp/puppeteer-cache

# Instala o server-puppeteer globalmente
RUN npm install -g @modelcontextprotocol/server-puppeteer

# Baixa a versão necessária do Chrome
RUN npx puppeteer browsers install chrome@131.0.6778.204

USER node

CMD ["npm", "start"]
