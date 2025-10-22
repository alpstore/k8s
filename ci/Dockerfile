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

# Create build directories and configure for OpenShift arbitrary UIDs
# OpenShift runs with random UID but always GID=0 (root group)
RUN mkdir -p /build /build/iso /build/aports /home/builder/.abuild && \
    chgrp -R 0 /build /home/builder && \
    chmod -R g=u /build /home/builder

# Generate signing keys (needed for abuild)
RUN adduser -D builder && \
    addgroup builder abuild && \
    su builder -c "abuild-keygen -a -n" && \
    chgrp -R 0 /home/builder/.abuild && \
    chmod -R g=u /home/builder/.abuild

WORKDIR /build

# Don't specify USER - OpenShift will run as arbitrary UID with GID=0
ENTRYPOINT ["/bin/sh"]
