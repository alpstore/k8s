FROM alpine:edge

# Install build dependencies
RUN apk add --no-cache \
    alpine-sdk \
    git \
    syslinux \
    xorriso \
    squashfs-tools \
    grub \
    mtools \
    abuild \
    alpine-conf

# Create build user and directories
RUN adduser -D builder && \
    addgroup builder abuild && \
    mkdir -p /build /build/iso /build/aports

# Generate signing keys as builder user
USER builder
WORKDIR /home/builder
RUN abuild-keygen -a -n

# Configure permissions for OpenShift arbitrary UIDs
# OpenShift runs with random UID but always GID=0 (root group)
USER root
RUN chgrp -R 0 /build /home/builder && \
    chmod -R g=u /build /home/builder

WORKDIR /build

# Don't specify USER - OpenShift will run as arbitrary UID with GID=0
ENTRYPOINT ["/bin/sh"]
