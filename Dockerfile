FROM wordpress:php8.4-apache
COPY custom.ini $PHP_INI_DIR/conf.d/
