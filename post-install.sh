topgrade -y
cd ./stow || exit
stow -v */ -t ../../
cp ../wallpapers/* /usr/share/backgrounds/
cp ../home_images/* ~/