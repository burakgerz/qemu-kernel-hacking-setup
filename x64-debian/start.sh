#!/bin/bash

#debug kernel/module
# use trace_printk() for printing and WARN_ON() for stack dump

# debug oot kernel module
# https://www.kernel.org/doc/html/v4.12/dev-tools/gdb-kernel-debugging.html
# -s for gdbserver stub... connect with gdb remote :1234
# compile oot with debug symbols
# insmod module
# cat /sys/module/mymodule/sections/.text
# add-symbol-file /path/to/my_module.ko <.text address> 
# start debugging

qemu-system-x86_64 -kernel <bzImage> -append "console=ttyS0 root=/dev/sda1" -M pc,accel=kvm -m 1G -drive file=./debian-12-nocloud-amd64.raw -netdev type=user,hostfwd=tcp::5573-:22,id=net0 -device virtio-net,netdev=net0 -rtc base=localtime -smp 4 -nographic -s -drive file=mydisk.img,if=virtio,format=raw

