#!/bin/bash
set -e

# Run the PHP script to initialize the database
echo "Initializing database..."
php /var/www/html/src/initialize_db.php

# Start the main application (e.g., Apache, PHP-FPM, etc.)
echo "Starting application..."
exec "$@"