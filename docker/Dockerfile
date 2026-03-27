# Documentation Build Environment - Ubuntu 22.04 (Jammy)
# This Dockerfile can be used standalone or as part of a devcontainer setup.

FROM ubuntu:22.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install Ruby and documentation build dependencies
RUN apt-get update && apt-get install -y \
    # Build essentials
    build-essential \
    # Ruby and development headers
    ruby-full \
    zlib1g-dev \
    # Git for source control and bundle operations
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Bundler gem
RUN gem install bundler

# Create a non-root user for development
ARG USERNAME=ros-dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/*

# Set the default user
USER $USERNAME

# Pre-install gems to a fixed path outside /workspace (which is bind-mounted at runtime).
# BUNDLE_PATH persists in the image so Jekyll finds the gems without any manual install step.
ENV BUNDLE_PATH=/home/${USERNAME}/bundle
COPY --chown=${USERNAME}:${USERNAME} Gemfile.local /tmp/Gemfile.local
RUN BUNDLE_GEMFILE=/tmp/Gemfile.local bundle install

# Set working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]
