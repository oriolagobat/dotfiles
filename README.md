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
- Set up ssh with github: `ssh-keygen -t ed25519-sk -C "email"`, and add to github
- Set wallpaper
- Set git user.email to the gpg email
- Set git signing key to the public gpg id

# Usefull commands
- ssh -oHostKeyAlgorithms=+ssh-dss <user>@<ip> -p <port>
- tar -czvf <file>.tar.gz <folder> # Compress
- tar -xzvf <file>.tar.gz # Decompress
- git rebase --signoff --root # Resign all commits
- pandoc file.md | lynx -stdin  # Preview md files from cli
