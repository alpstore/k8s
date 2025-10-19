#!/bin/sh
# Script to build custom Alpine Linux ISO

set -e

PROFILE="${PROFILE:-standard}"
ARCH="${ARCH:-x86_64}"
OUTDIR="${OUTDIR:-/build/iso}"
TAG="${TAG:-edge}"

echo "Building Alpine Linux ISO..."
echo "Profile: $PROFILE"
echo "Architecture: $ARCH"
echo "Tag: $TAG"

# Clone aports if not present
if [ ! -d "/build/aports" ]; then
    echo "Cloning aports repository..."
    git clone --depth=1 https://gitlab.alpinelinux.org/alpine/aports.git /build/aports
fi

# Create output directory
mkdir -p "$OUTDIR"

# Run mkimage
cd /build/aports
sh scripts/mkimage.sh \
    --tag "$TAG" \
    --outdir "$OUTDIR" \
    --arch "$ARCH" \
    --repository "https://dl-cdn.alpinelinux.org/alpine/$TAG/main" \
    --repository "https://dl-cdn.alpinelinux.org/alpine/$TAG/community" \
    --profile "$PROFILE"

echo "ISO build complete! Output in $OUTDIR"
ls -lh "$OUTDIR"
