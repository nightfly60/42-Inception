FROM wordpress:php8.2-fpm-alpine

# Installer extensions PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql


# Copier une config PHP-FPM personnalisée
COPY conf/php-fpm.conf /usr/local/etc/php-fpm.d/zz-custom.conf

# Droits WordPress
RUN chown -R www-data:www-data /var/www/html

# Installer wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# setup pour init la db avec les users
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]

