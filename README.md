# Parrot-VMWare-Compatability-Script
Experimental VMware Player 17.6.3 patch for Parrot/Debian kernel 6.17.x. Tested on Parrot 7.2, kernel 6.17.13+2-amd64, GCC 14. Unsupported by VMware/Broadcom. Use at your own risk.


##Overview

This repo provides an experimental kludge patch and build script to run VMware Workstation Player 17.6.3 on Linux Kernels 6.17.x. This was tested on Parrot OS 7.2, Debian-based systems, GCC 14 toolchain

VMware does **not officially support** kernel 6.17 at the time of writing. This project works around multiple incompatibilities in VMware’s kernel modules (`vmmon` and `vmnet`).

This work is based on VMware module failures and community knowledge around VMware module patching

This script:

- Extracts VMware kernel module sources
- Applies compatibility patches for:
  - Missing internal headers
  - Kernel API changes
  - Deprecated module entry points (`init_module`)
  - GCC 14 strict compilation behavior
- Builds and installs:
  - `vmmon.ko`
  - `vmnet.ko`
- Fixes device permissions (`/dev/vmmon`)
- Loads required modules

## Requirements

- VMware Player **17.6.3 installed**
- Kernel headers installed:
  ```bash
  sudo apt install linux-headers-$(uname -r)

How to:

1. run: sudo apt install build-essential
2. Clone repo:  git clone https://github.com/aparker4j/Parrot-VMWare-Compatability-Script && cd https://github.com/aparker4j/Parrot-VMWare-Compatability-Script
3. Make script executable: chmod +x vmware-17.6.3-kernel-6.17-fix.sh
4. Run script: ./vmware-17.6.3-kernel-6.17-fix.sh
5. Launch VMware: vmplayer


Persistence - Modules will break after kernel updates. Reload modules either manually with: sudo modprobe vmmon && sudo modprobe vmnet or prevent kernel upgrade via: sudo apt-mark hold linux-image-amd64 linux-headers-amd64

   Troubleshooting
   Check modules : lsmod | grep -E 'vmmon|vmnet'
   Check device : ls -l /dev/vmmon
   If permissions are wrong: sudo chmod 666 /dev/vmmon
