# Note: You can use any Debian/Ubuntu based image you want. 
# FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye
# FROM mcr.microsoft.com/devcontainers/universal:2

FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye

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
    
# [Option] Install zsh
ARG INSTALL_ZSH="true"
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="false"
# [Option] Enable non-root Docker access in container
ARG ENABLE_NONROOT_DOCKER="true"
# [Option] Use the OSS Moby CLI instead of the licensed Docker CLI
ARG USE_MOBY="true"

# Enable new "BUILDKIT" mode for Docker CLI
ENV DOCKER_BUILDKIT=1

# Install needed packages and setup non-root user. Use a separate RUN statement to add your
# own dependencies. A user of "automatic" attempts to reuse a user ID if one already exists.
ARG USERNAME=automatic
ARG USER_UID=1000
ARG USER_GID=$USER_UID
COPY library-scripts/*.sh /tmp/library-scripts/
COPY .devcontainer/library-scripts/*.sh /tmp/library-scripts/

RUN apt-get update \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true" \
    # Use Docker script from script library to set things up
    && /bin/bash /tmp/library-scripts/docker-debian.sh "${ENABLE_NONROOT_DOCKER}" "/var/run/docker-host.sock" "/var/run/docker.sock" "${USERNAME}" \
    # Clean up
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

# Grant sudo permissions to the user
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Set working directory to the project root
# WORKDIR /workspaces/uipa

# Copy requirements.txt and init_db.sh to the container

# COPY requirements.txt /workspaces/uipa/ worked when moved inside same dir of docker
COPY ../requirements.txt /workspaces/uipa/


# COPY init_db.sh tmp/workspaces/uipa/data/seed/
COPY ../init_db.sh /workspaces/uipa/data/seed/

# Debugging: display the contents of requirements.txt
RUN echo "Displaying requirements.txt:" && cat /workspaces/uipa/requirements.txt

# Install Python dependencies
RUN pip install -r /workspaces/uipa/requirements.txt \
    && chmod +x /workspaces/uipa/data/seed/init_db.sh
    
# Set ENTRYPOINT to run docker and your initialization script
ENTRYPOINT ["/bin/sh", "-c", "dockerd & while(! docker info > /dev/null 2>&1); do sleep 1; done; cd /workspaces/uipa && ./data/seed/init_db.sh && python manage.py runserver 0.0.0.0:8000"]

# Keep the container running
CMD ["sleep", "infinity"]
