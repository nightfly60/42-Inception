# Docker nginx sur debian
FROM nginx:alpine

# Installer openssl
RUN apk add --no-cache openssl

# Creation d'un dossier pour les certificats
RUN mkdir -p /etc/nginx/ssl

# Générer un certificat auto-signé
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/privkey.pem \
    -out /etc/nginx/ssl/fullchain.pem \
    -subj "/CN=localhost"

# Copier le fichier config dans le container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Port HTTPS
EXPOSE 443

# Lancer nginx
CMD ["nginx"]
