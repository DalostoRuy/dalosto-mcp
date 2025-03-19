FROM n8nio/n8n:latest

# Muda para o usuário root para instalar pacotes do sistema e npm globalmente
USER root

# Atualiza o apk e instala as dependências necessárias para o Chromium no Alpine
RUN apk update && apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ttf-freefont \
    ca-certificates

# Instala o server-puppeteer globalmente
RUN npm install -g @modelcontextprotocol/server-puppeteer

# Baixa a versão do Chrome necessária para o Puppeteer
RUN npx puppeteer browsers install chrome@131.0.6778.204

# Define a variável de ambiente para o diretório de cache do Puppeteer
ENV PUPPETEER_CACHE_DIR=/home/node/.cache/puppeteer

# Retorna para o usuário padrão
USER node
