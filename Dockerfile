# Use the official Python image as the base image
FROM mcr.microsoft.com/devcontainers/python:3.12

# Install main dependencies in one step to reduce layers
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        libpoppler-cpp-dev \
        python-is-python3 \
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

# Create and activate a virtual environment
RUN python3 -m venv /workspace/venv

# Upgrade pip
RUN /workspace/venv/bin/pip install --upgrade pip

# Install dependencies
RUN /workspace/venv/bin/pip install -r requirements.txt

# Set environment variables to use the virtual environment by default
ENV VIRTUAL_ENV=/workspace/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Start Docker daemon

# should already be available by default? 
CMD ["sudo", "service", "docker", "start"]
