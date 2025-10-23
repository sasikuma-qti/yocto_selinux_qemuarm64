Install qemu tools
#sudo apt install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping libsdl1.2-dev xterm qemu-system qemu-utils \
	 qemu-system-arm qemu-efi-aarch64

Build yocto selinux qemuarm64 build using below
#cd yocto_selinux_qemuarm64
#kas build ci/linux-qemuarm64-selinux.yml

Running qemuarm64 on machine
#chmod +x ./run/run_qemu.sh
#./run/run_qemu.sh
