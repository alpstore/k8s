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

# Create build user
RUN adduser -D builder && \
    addgroup builder abuild && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder

USER builder
WORKDIR /home/builder

# Generate signing keys
RUN abuild-keygen -a -n

USER root
WORKDIR /build

ENTRYPOINT ["/bin/sh"]
