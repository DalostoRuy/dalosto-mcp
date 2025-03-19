FROM n8nio/n8n:latest

#Switch to root user to install global npm packages
USER root

# Install the desired npm packages globally
RUN npm install -g @modelcontextprotocol/server-puppeteer

# Baixa a versão do Chrome necessária para o Puppeteer
RUN npx puppeteer browsers install chrome@131.0.6778.204

# Revert to the node user for security purposes
USER node
