FROM php:8.1-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql
COPY src/ /var/www/html/

RUN apt-get update && apt-get install -y php-cli

# Copy your initialization script
COPY init.php /usr/local/bin/

# Run the PHP script during image build
RUN php /usr/local/bin/init.php

EXPOSE 3050
CMD ["apache2-foreground"]