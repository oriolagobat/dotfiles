topgrade -y
cd ./stow || exit

# Delete conf files
rm ~/.i3/config
rm ~/.zshrc
rm ~/.p10k.zsh

#Stow
stow -v */ -t ../../

# Oh my zsh plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Copy images and wallpapers
sudo cp wallpapers/wallpapers/* /usr/share/backgrounds/
sudo cp ../home_images/* ~/

# Services
sudo systemctl enable --now bluetooth