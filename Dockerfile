
# Use the slim version of Python as the base image
FROM python:3.11-slim

# Set environment variables to avoid Python output buffering
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the dependencies in the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Install Gunicorn for production server
RUN pip install gunicorn

COPY start.sh ./app/
# Copy the entire Django project into the container
COPY . /app/

# Expose the port that Gunicorn will run on
EXPOSE 8000

ENTRYPOINT ["sh", "start.sh"]
