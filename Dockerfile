FROM php:8.1-apache

# Install PostgreSQL extensions for Supabase (which is based on PostgreSQL)
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Copy application source code
COPY src/ /var/www/html/

# Create an entrypoint script
RUN echo '#!/bin/bash\n\
# Run the database initialization script\n\
php /var/www/html/initialize_db.php\n\
\n\
# Start Apache in foreground\n\
apache2-foreground' > /usr/local/bin/docker-entrypoint.sh \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3050

# Use our custom entrypoint script
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]