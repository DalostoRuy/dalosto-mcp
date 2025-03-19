FROM n8nio/n8n:latest

# Altera para usuário root para instalar pacotes do sistema e npm globalmente
USER root

# Atualiza e instala as dependências necessárias para o Chrome
RUN apt-get update && apt-get install -y \
    chromium-browser \
    libgbm1 \
    libnss3 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    libxdamage1 \
    libxrandr2 \
    libxfixes3 \
    libxi6 \
    libxrender1 \
    ca-certificates \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Instala o server-puppeteer globalmente
RUN npm install -g @modelcontextprotocol/server-puppeteer

# Baixa a versão do Chrome necessária para o Puppeteer
RUN npx puppeteer browsers install chrome@131.0.6778.204

# (Opcional) Define a variável de ambiente para garantir o caminho do cache
ENV PUPPETEER_CACHE_DIR=/home/node/.cache/puppeteer

# Se necessário, retorne para o usuário padrão do container
USER node
