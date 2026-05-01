# Parrot-VMWare-Compatability-Script
Experimental VMware Player 17.6.3 patch for Parrot/Debian kernel 6.17.x. Tested on Parrot 7.2, kernel 6.17.13+2-amd64, GCC 14. Unsupported by VMware/Broadcom. Use at your own risk.


##Overview

This repo provides an experimental kludge patch and build script to run VMware Workstation Player 17.6.3 on Linux Kernels 6.17.x. This was tested on Parrot OS 7.2, Debian-based systems, GCC 14 toolchanin

VMware does **not officially support** kernel 6.17 at the time of writing. This project works around multiple incompatibilities in VMware’s kernel modules (`vmmon` and `vmnet`).

This work is based on VMware module failures and community knowledge around VMware module patching
