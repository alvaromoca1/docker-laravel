FROM --platform=linux/arm64 php:7.4-fpm

COPY composer*.json /var/www/

WORKDIR /var/www/

RUN apt-get update && apt-get install -y \
    build-essential \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    git \
    curl

RUN docker-php-ext-install pdo_mysql zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# Instalar composer usando el script oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# No ejecutamos composer install aquí porque los paquetes necesitan ser compatibles con ARM
# Lo haremos después de levantar el contenedor

COPY . /var/www/

EXPOSE 9000

CMD ["php-fpm"]