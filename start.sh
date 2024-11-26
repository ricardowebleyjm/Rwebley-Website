#!/bin/bash

# Run Django migrations
echo "Applying database migrations..."
python manage.py migrate

# Collect static files (optional for production)
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Run Gunicorn server
echo "Starting Gunicorn server..."
exec gunicorn --bind 0.0.0.0:8000 rwebley_website.wsgi:application
