FROM bitnami/minideb
# Install required system packages
RUN install_packages curl software-properties-common gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && install_packages nodejs
# Copy application files
COPY . /app
# Install NPM dependencies
RUN npm install --prefix /app
EXPOSE 80
CMD ["npm", "start", "--prefix", "app"]
