FROM php:8.1-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql
COPY src/ /var/www/html/

# Copy your initialization script
COPY src/initialize_db.php ./initialize_db.php

# Run the PHP script to initialize the database
# (If the database is available at build time, use RUN; otherwise, use CMD)
RUN php initialize_db.php

EXPOSE 3050
CMD ["apache2-foreground"]