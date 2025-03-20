FROM n8nio/n8n:latest

USER root

# Instala o server-puppeteer globalmente
RUN npm install -g @modelcontextprotocol/server-puppeteer

# Baixa a versão necessária do Chrome
RUN npx puppeteer browsers install chrome
