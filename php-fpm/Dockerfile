FROM php:7.2-fpm

RUN /usr/sbin/usermod -u 1000 www-data

# Installing packages
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libicu-dev \
    g++

# Install php packages
RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    intl \
    zip \
    opcache \
    && pecl install xdebug

# Configuring packages
RUN docker-php-ext-configure intl

# Install phpunit
RUN curl -sS https://phar.phpunit.de/phpunit-6.5.phar  | php -- --install-dir=/usr/local/bin --filename=phpunit

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php.ini /usr/local/etc/php/php.ini

COPY initsymfony.sh /usr/local/bin/initsymfony
RUN chmod +x /usr/local/bin/initsymfony

RUN echo 'alias sf="php bin/console"' >> ~/.bashrc

WORKDIR /opt/project
