#!/bin/sh
set -e

WP_PATH=/var/www/html

until nc -z "$WORDPRESS_DB_HOST" 3306 >/dev/null 2>&1; do
  sleep 2
done

if ! wp core is-installed --path="$WP_PATH" --allow-root >/dev/null 2>&1; then
    php -d memory_limit=512M /usr/local/bin/wp core download --path="$WP_PATH" --allow-root

    wp config create \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --dbhost="$WORDPRESS_DB_HOST" \
      --allow-root
fi

wp core install \
  --url="https://edurance.42.fr" \
  --title="salut a tous les amis" \
  --admin_user="$ADMIN_LOGIN" \
  --admin_password="$ADMIN_PASS" \
  --admin_email="$ADMIN_LOGIN@mail.com" \
  --skip-email \
  --allow-root

echo "WordPress is fully ready"

if [ -n "$ADMIN_LOGIN" ] && ! wp user get "$ADMIN_LOGIN" --path="$WP_PATH" --allow-root >/dev/null 2>&1; then
  wp user create "$ADMIN_LOGIN" "$ADMIN_LOGIN@mail.com" \
    --role=administrator \
    --user_pass="$ADMIN_PASS" \
    --path="$WP_PATH" \
    --allow-root
fi

if [ -n "$USER_LOGIN" ] && ! wp user get "$USER_LOGIN" --path="$WP_PATH" --allow-root >/dev/null 2>&1; then
  wp user create "$USER_LOGIN" "$USER_LOGIN@mail.com" \
    --role=subscriber \
    --user_pass="$USER_PASS" \
    --path="$WP_PATH" \
    --allow-root
fi

echo "WordPress users created"

exec php-fpm
