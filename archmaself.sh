#!/bin/bash

    bash 0-preinstall.sh
    arch-chroot /mnt /root/ArchMaself/1-setup.sh
    source /mnt/root/ArchMaself/install.conf
    arch-chroot /mnt /usr/bin/runuser -u $username -- /home/$username/ArchMaself/2-user.sh
    arch-chroot /mnt /root/ArchMaself/3-post-setup.sh