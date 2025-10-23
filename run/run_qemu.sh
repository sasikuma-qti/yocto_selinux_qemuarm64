#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -k <kernel_image> -r <rootfs_image>"
    exit 1
}

# Parse command-line options
while getopts "k:r:" opt; do
  case $opt in
    k) KERNEL_IMAGE="$OPTARG"
    ;;
    r) ROOTFS_IMAGE="$OPTARG"
    ;;
    *) usage
    ;;
  esac
done

# Check if both parameters are provided
if [ -z "$KERNEL_IMAGE" ] || [ -z "$ROOTFS_IMAGE" ]; then
    echo "Error: Both kernel and rootfs images must be specified."
    usage
fi

# Run QEMU
qemu-system-aarch64 \
    -machine virt \
    -cpu cortex-a57 \
    -m 1024 \
    -nographic \
    -kernel "$KERNEL_IMAGE" \
    -append "root=/dev/vda rw console=ttyAMA0" \
    -drive file="$ROOTFS_IMAGE",format=raw,if=virtio \
    -netdev user,id=net0 -device virtio-net-device,netdev=net0
