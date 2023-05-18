#!/usr/bin/bash

# Fix time
sudo timedatectl set-ntp true
hwclock --systohc

# Copy system files
sudo cp ./sys-files/makepkg.conf /etc/makepkg.conf
sudo cp ./sys-files/pacman.conf /etc/pacman.conf
sudo cp ./sys-files/mimeapps.list ~/.config/mimeapps.list
cp .sys-files/.gitconfig ~/.gitconfig

# Update mirrors
sudo pacman-mirrors --fasttrack

# Update system
sudo pacman -Syu

# Enable trim, once a week
sudo systemctl enable fstrim.timer

# Reduce swappiness, not that much needed with 32GB of RAM
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# Install pacman packages
sudo pacman -S --needed - < ./packages/pacman-packages.txt
yay -S --needed - < ./packages/aur-packages.txt
pip3 install -r ./packages/pip-packages.txt

# Update mime database
echo "export BROWSER=/usr/bin/firefox" | sudo tee -a ~/.profile
xdg-settings set default-web-browser firefox.desktop

# Upgrade kernel
sudo mhwd-kernel -i linux63 rmc

echo "Reboot after updating to zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
