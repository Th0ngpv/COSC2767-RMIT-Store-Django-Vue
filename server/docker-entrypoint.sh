#!/bin/sh

# Stop if a command fails
set -e

# Apply database migrations
echo "Running database migrations..."
python manage.py migrate --noinput

# Start Gunicorn
echo "Starting Gunicorn..."
exec gunicorn \
    --workers 3 \
    --bind 0.0.0.0:8000 \
    config.wsgi:application
