#!/bin/bash

sudo cp ~/Desktop/vmware-modules-backup/*.ko /lib/modules/$(uname -r)/kernel/drivers/misc/
sudo depmod -a
sudo modprobe vmmon
sudo modprobe vmnet
