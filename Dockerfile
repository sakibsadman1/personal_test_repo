FROM php:8.1-apache

# Set the working directory
WORKDIR /var/www/html

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Copy the application files (including the src folder)
COPY . .

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Start Apache in the foreground
CMD ["apache2-foreground"]