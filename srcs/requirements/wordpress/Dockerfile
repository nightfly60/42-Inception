FROM wordpress:php8.2-fpm-alpine

# Installer extensions PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copier une config PHP-FPM personnalisée
COPY conf/php-fpm.conf /usr/local/etc/php-fpm.d/zz-custom.conf

# Droits WordPress
RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm"]
