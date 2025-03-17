FROM php:8.1-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the entire src folder to the working directory
COPY src/ .

# Copy the custom Apache configuration
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Enable the configuration and restart Apache
RUN a2ensite 000-default.conf && a2enmod rewrite

# Run the PHP script to initialize the database at container startup
CMD php initialize_db.php && apache2-foreground

# Expose port 3050
EXPOSE 3050
CMD ["apache2-foreground"]