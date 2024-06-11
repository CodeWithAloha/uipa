# Use the official Python image as the base image
FROM mcr.microsoft.com/devcontainers/python:3.12

# Install main dependencies in one step to reduce layers
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        # libqpdf-dev \
        # g++ \
        # wget \
        # python3-pip \
        # python3-psycopg2 \
        # python3-lxml \
        # python-is-python3 \
        # python3-venv \
        # libxml2-dev \
        # libpq-dev \
        # libgdal-dev \
        # imagemagick \
        # git \
        # libpangocairo-1.0-0 \
        # libmagic1 \
        # sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose ports (if necessary)
# EXPOSE 8000 5432 9200

# Copy the requirements file to the working directory
COPY requirements.txt .

# Create and activate a virtual environment, then install dependencies
RUN python3 -m venv /workspace/venv \
    && /workspace/venv/bin/pip install --upgrade pip \
    && /workspace/venv/bin/pip install -r requirements.txt

# Set environment variables to use the virtual environment by default
ENV VIRTUAL_ENV=/workspace/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Start Docker daemon

# should already be available by default? 
# CMD ["sudo", "service", "docker", "start"]
