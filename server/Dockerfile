# Python base image
FROM python:3.11-slim

# Set application directory
WORKDIR /app

# Python runtime settings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .

# Collect static files during build
RUN python manage.py collectstatic --noinput

# Add container startup script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Gunicorn listens on port 8000
EXPOSE 8000

# Start the application
ENTRYPOINT ["/docker-entrypoint.sh"]
