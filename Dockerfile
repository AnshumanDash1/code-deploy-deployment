# # Base image
# FROM ubuntu:14.04

# # installes required packages for our script
# RUN	apk add --no-cache \
#   bash \
#   ca-certificates \
#   curl \
#   jq

# # Copies your code file  repository to the filesystem
# COPY entrypoint.sh /entrypoint.sh

# # change permission to execute the script and
# RUN chmod +x /entrypoint.sh

#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]

# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
