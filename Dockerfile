# FROM ubuntu:22.04

# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]

FROM node:14-alpine

# Install packages
RUN apk update && apk add --update --no-cache \
    git \
    bash \
    curl \
    openssh \
    python3 \
    py3-pip \
    py-cryptography \
    wget \
    curl

RUN apk --no-cache add --virtual builds-deps build-base python3

# Update NPM
RUN npm config set unsafe-perm true
RUN npm update -g

# Install AWSCLI
RUN pip install --upgrade pip && \
    pip install --upgrade awscli

# Install Serverless Framework
RUN npm install -g serverless

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 
RUN chmod +x /extract-s3-from-arn.sh

ENTRYPOINT ["/entrypoint.sh"]
