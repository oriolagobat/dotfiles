topgrade -y
cd ./stow || exit
rm ~/.i3/config
rm ~/.zshrc
rm ~/.p10k.zsh
stow -v */ -t ../../
sudo cp ../wallpapers/* /usr/share/backgrounds/
sudo cp ../home_images/* ~/
