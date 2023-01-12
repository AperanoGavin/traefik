FROM php:apache
WORKDIR /var/www

RUN  apt-get update && apt-get install \
     nano \
      -y wget \
      -y git 

RUN groupadd -g 1000 www 

RUN useradd -u 1000 -g www www

RUN  docker-php-ext-install   pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

USER  www

COPY  --chown=www:www  . /var/www

COPY . /var/www
