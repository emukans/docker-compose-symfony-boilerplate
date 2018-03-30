FROM php:7.2-fpm

RUN /usr/sbin/usermod -u 1000 www-data

# Install php packages
RUN docker-php-ext-install pdo pdo_mysql \
    && pecl install xdebug

# Install phpunit
RUN curl -sS https://phar.phpunit.de/phpunit-6.5.phar  | php -- --install-dir=/usr/local/bin --filename=phpunit

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php.ini /usr/local/etc/php/php.ini

RUN echo 'alias sf="php app/console"' >> ~/.bashrc
RUN echo 'alias sf3="php bin/console"' >> ~/.bashrc

WORKDIR /opt/project
