FROM php:8.1-apache
MAINTAINER SheepDev <webmaster.crazyowl@gmail.com>

RUN apt-get update
RUN apt-get install -y vim \
    git \
    curl \
    unzip \
    g++ \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libzip-dev

RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql

#RUN pecl install xdebug-2.9.6
#RUN docker-php-ext-enable xdebug

# Get composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Move entrypoint script
COPY ./entrypoint.sh /home
RUN chmod a+x /home/entrypoint.sh

# Comfigure Apache
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin
RUN a2enmod  rewrite headers

EXPOSE 80
#CMD [ "/bin/bash", "/home/entrypoint.sh" ]