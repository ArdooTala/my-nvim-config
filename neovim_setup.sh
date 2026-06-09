#!/usr/bin/bash

# Install dependencies
apt update
apt -y --no-install-recommends install \
    ripgrep xclip curl git \
    python-dev python-pip python3-dev python3-pip python3-neovim 

# Config
git clone https://github.com/ArdooTala/my-nvim-config.git ~/.config/nvim/
echo 'export TERM="xterm-256color"' >> ~/.bashrc

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
