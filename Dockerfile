# Use the official PHP image as the base image
FROM php:7.4-cli

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    git \
    nano

# Install PHP extensions
RUN docker-php-ext-install pdo_sqlite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clone the repository
RUN git clone https://github.com/gokhanmeteerturk/cronnit-docker.git /app/cronnit

# Install project dependencies
RUN cd /app/cronnit && composer update

# Copy the configuration file
COPY config.php.example /app/cronnit/config.php

# Expose the port your application will listen on
EXPOSE 8080

# Start the PHP built-in web server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/app/cronnit/public_html"]
