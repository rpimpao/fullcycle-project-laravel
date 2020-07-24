FROM php:7.3.6-fpm-alpine3.9

# Enable usermod command
RUN apk add --no-cache shadow

WORKDIR /var/www

RUN rm -rf /var/www/html

COPY . /var/www

RUN ln -s public html

# Add www-data to group 1000
RUN usermod -u 1000 www-data

# Set user www-data as default instead of root
USER www-data

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
