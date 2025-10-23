# Yocto SELinux QEMU ARM64 Setup

This repository provides a setup to build and run a Yocto-based Linux image with SELinux enabled for the QEMU ARM64 virtual machine.

---

## Prerequisites

Install the required packages for building Yocto and running QEMU:

```bash
sudo apt install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping libsdl1.2-dev xterm qemu-system qemu-utils qemu-system-arm qemu-efi-aarch64
```

---

## Building Yocto SELinux for QEMU ARM64

To build the Yocto SELinux image for QEMU ARM64, follow the steps below:

### Step 1: Navigate to the Project Directory

```bash
cd yocto_selinux_qemuarm64
```

### Step 2: Start the Build Using kas

```bash
kas build ci/linux-qemuarm64-selinux.yml
```

> **Note:** If `kas` is not installed, you can install it using:
> ```bash
> pip3 install kas
> ```

---

## Running the QEMU ARM64 Virtual Machine

After building the image, use the provided script to launch the QEMU virtual machine.

### Step 1: Make the Script Executable

```bash
chmod +x ./run/run_qemu.sh
```

### Step 2: Run the Script

```bash
./run/run_qemu.sh -k <path_to_kernel_image> -r <path_to_rootfs_image>
```

### Example:

```bash
./run/run_qemu.sh -k build/tmp/deploy/images/qemuarm64/Image -r build/tmp/deploy/images/qemuarm64/core-image-selinux-qemuarm64.rootfs.ext4
```

---

## Script Details

The `run_qemu.sh` script launches a QEMU virtual machine with the following configuration:

- **Machine**: `virt`
- **CPU**: `cortex-a57`
- **Memory**: `1024 MB`
- **Console**: `ttyAMA0`
- **Root Device**: `/dev/vda`
- **Networking**: User-mode networking with a virtual NIC

### Script Usage

```bash
./run_qemu.sh -k <kernel_image> -r <rootfs_image>
```

#### Options

- `-k <kernel_image>`: Path to the kernel image (e.g., `Image`)
- `-r <rootfs_image>`: Path to the root filesystem image (e.g., `.ext4`)

