FROM wordpress:apache
COPY custom.ini $PHP_INI_DIR/conf.d/
