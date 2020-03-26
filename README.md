# CodeGoalie dotfiles

This repo contains my personal configs and how to setup a new machine with them.

## Getting started

There are a few commands to run before the install script can take over:

```bash
sudo apt install git build-essential
cd ~
mkdir -p .local/
cd ~/.local
git clone https://github.com/codegoalie/dotfiles.git
cd dotfiles

sudo apt-get install -y zsh
chsh -s $(which zsh)
```

Now, log out and log back in to activate zsh.

Then, run `./new-machine.sh`.
