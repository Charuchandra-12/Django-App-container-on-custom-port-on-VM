# # Use an official Python runtime as a base image
# FROM python:3.9-slim

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Install netcat for database check in entrypoint.sh
# RUN apt-get update \
#     && apt-get install -y netcat \
#     && apt-get clean

# # Set the working directory in the container
# WORKDIR /app

# # Copy the dependencies file to the working directory
# COPY requirements.txt .

# # Install any dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the current directory contents into the container at /app/
# COPY . .

# # Copy entrypoint script into the container and make it executable
# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# # Define the script to be executed when the container starts
# ENTRYPOINT ["/entrypoint.sh"]



# Use Python Alpine image for a smaller footprint
FROM python:3.9-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app/
COPY . .

# Expose the internal port, Gunicorn will use this
EXPOSE 8000

# Start Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "hello.wsgi:application"]
