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

# Create a non-root user and group named `devuser` with UID and GID 1000 if they don't already exist
# RUN if ! getent group devuser > /dev/null; then groupadd -g 1000 devuser; fi \
#     && if ! id -u devuser > /dev/null 2>&1; then useradd -u 1000 -g devuser -m -s /bin/bash devuser; fi

# Ensure devuser has the appropriate permissions for directories
# RUN chown -R devuser:devuser /usr/share/elasticsearch/data /var/log /workspaces/uipa

# Set the working directory
WORKDIR /workspaces/uipa

# Switch to the devuser
USER devuser

# Expose ports (if necessary)
# EXPOSE 8000 5432 9200

# Copy the requirements file to the working directory
# COPY requirements.txt .

# Display the contents of requirements.txt for debugging
# RUN echo "Displaying requirements.txt:" && cat requirements.txt

# Display Python and pip versions for debugging
# RUN python3 --version && pip --version

# Upgrade pip
# RUN pip install --upgrade pip

# Install dependencies globally (for debugging purposes)
# RUN pip install -r requirements.txt

# Keep Container On
# CMD ["sleep", "infinity"]

# This command below + docker-compose up in post create command works
# CMD ["sh", "-c", "sudo service docker start && sleep infinity"]

# Using this to prevent other commands from overwriting / stopping the container
# ENTRYPOINT ["tail", "-f", "/dev/null"]
