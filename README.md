+# Instructions
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
- Set up gpg
	- Get my pub.key: `tar -xzf gpg-datadir.tar.gz .gnupg/my_keys/pub.key`
	- gpg --import pub.key
	- gpg --edit-key "email from gpg key" -> trust -> 5
- Set up ssh with github: `ssh-keygen -t ed25519-sk -C "email"`, and add to github
- Set wallpaper
- Set git user.email to the gpg email
- Set git signing key to the public gpg id
- Set up yubikey for sign-in:
```bash
mkdir ~/.config/Yubico
pamu2fcfg >> ~/.config/Yubico/u2f_keys  # For each key
echo "auth required pamu2f.so cue [cue_prompt=Tap the Yubikey to sudo]" > /etc/pam.d/sudo
echo "auth required pamu2f.so cue [cue_prompt=Tap the Yubikey to unlock]" > /etc/pam.d/i3lock
echo "auth required pamu2f.so cue [cue_prompt=Tap the Yubikey to login]" > /etc/pam.d/login
echo "auth required pamu2f.so cue [cue_prompt=Tap the Yubikey to login]" > /etc/pam.d/system-login
```

# Usefull commands
- ssh -oHostKeyAlgorithms=+ssh-dss <user>@<ip> -p <port>
- tar -czvf <file>.tar.gz <folder> # Compress
- tar -xzvf <file>.tar.gz # Decompress
- git rebase --signoff --root # Resign all commits
- pandoc file.md | lynx -stdin  # Preview md files from cli
- gpg-connect-agent "key serial number" "learn --force" /bye  # Link yubikey with same pgp keys to work on linux
- shuf -i 10-99 -n 1  # Generate one random number between 10 and 100
