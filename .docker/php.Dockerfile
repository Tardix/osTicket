FROM php:7.4-fpm


RUN apt-get update
RUN apt-get install -y zlib1g-dev libzip-dev libicu-dev g++ libpng-dev libonig-dev libc-client-dev libkrb5-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip
RUN docker-php-ext-install mbstring;
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap
RUN pecl install apcu && docker-php-ext-enable apcu
RUN docker-php-ext-install opcache
#RUN pecl install xdebug && docker-php-ext-enable xdebug