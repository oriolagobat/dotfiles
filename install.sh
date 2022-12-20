#!/usr/bin/bash

# Copy system files
sudo cp ./sys-files/makepkg.conf /etc/makepkg.conf
sudo cp ./sys-files/pacman.conf /etc/pacman.conf

# Update mirrors
sudo pacman-mirrors --fasttrack

# Enable trim, once a week
sudo systemctl enable fstrim.timer

# Reduce swappiness, not that much needed with 32GB of RAM
sudo sysctl vm.swappiness=10

# Install packages
sudo pacman -S --needed - < ./packages/pacman-packages.txt
yay -S --needed - < ./packages/aur-packages.txt

# Upgrade kernel
sudo mhwd-kernel -i linux60 rmc

# Reboot
sudo reboot