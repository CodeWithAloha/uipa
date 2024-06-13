# Use the official Python image as the base image
# FROM mcr.microsoft.com/devcontainers/python:3.12

# Default Codespaces image
FROM mcr.microsoft.com/devcontainers/universal:2

# Install main dependencies in one step to reduce layers
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        libpoppler-cpp-dev \
        python-is-python3 \
        # gdal-bin \d
        # libgdal-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose ports (if necessary)
# EXPOSE 8000 5432 9200


# Copy the requirements file to the working directory
COPY requirements.txt .

# Display the contents of requirements.txt for debugging
RUN echo "Displaying requirements.txt:" && cat requirements.txt

# Display Python and pip versions for debugging
RUN python3 --version && pip --version

# Upgrade pip
RUN pip install --upgrade pip

# Install dependencies globally
RUN pip install -r requirements.txt

# Start Docker daemon
CMD ["sudo", "service", "docker", "start"]
