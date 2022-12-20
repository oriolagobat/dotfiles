#!/usr/bin/bash

# Copy system files
sudo cp ./sys-files/makepkg.conf /etc/makepkg.conf
sudo cp ./sys-files/pacman.conf /etc/pacman.conf

# Update mirrors
sudo pacman-mirrors --fasttrack

# Enable trim, once a week
sudo systemctl enable fstrim.timer

# Reduce swappiness, not that much needed with 32GB of RAM
# TODO: Not permanent, find a way to make it permanent
sudo sysctl vm.swappiness=10

# Install pacman packages
sudo pacman -S --needed - < ./packages/pacman-packages.txt
yay --save --makepkgconf /etc/makepkg.conf
yay -S --needed - < ./packages/aur-packages.txt
pip3 install -r ./packages/pip-packages.txt
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Upgrade kernel
sudo mhwd-kernel -i linux60 rmc

# Reboot
sudo reboot