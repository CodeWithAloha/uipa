# Use the official Python image as the base image
# FROM mcr.microsoft.com/devcontainers/python:3.12

# Default Codespaces image
FROM mcr.microsoft.com/devcontainers/universal:2

# Install main dependencies in one step to reduce layers
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        libpoppler-cpp-dev \
        python-is-python3 \
        gdal-bin \
        libgdal-dev \
        imagemagick \
        libmagickwand-dev \
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

# Keep Container On
# CMD ["sleep", "infinity"]

# this command below + docker compose up in post create command works

# CMD ["sh", "-c", "sudo service docker start && sleep infinity"]

# using this to prevent other commands from overwriting / stopping the container

ENTRYPOINT ["tail", "-f", "/dev/null"]

