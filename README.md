# Instructions
```shell
git clone https://github.com/oriolagobat/dotfiles
cd dotfiles
chmod +x pre-install.sh
chmod +x post-install.sh
./pre-install.sh
```
Then, after the system has restarted, run the following command:
```shell
./post-install.sh
```

# TODO
- Set up ssh with github
  https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
- Set up gpg with github
  https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
- Set wallpaper

# Usefull commands
ssh -oHostKeyAlgorithms=+ssh-dss <user>@<ip> -p <port>
tar -czvf <file>.tar.gz <folder> # Compress
tar -xzvf <file>.tar.gz # Decompress
git rebase --signoff --root # Resign all commits
