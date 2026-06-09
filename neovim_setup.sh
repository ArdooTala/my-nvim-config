#!/usr/bin/bash

set -e

# Install dependencies
apt update
apt -y --no-install-recommends install \
    ripgrep xclip curl git \
    python3-dev python3-pip python3-neovim 

# Config
git clone https://github.com/ArdooTala/my-nvim-config.git ~/.config/nvim/
echo 'export TERM="xterm-256color"' >> ~/.bashrc

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz
sudo rm -rf /opt/nvim-linux-arm64
sudo tar -C /opt -xzf nvim-linux-arm64.tar.gz
rm nvim-linux-arm64.tar.gz
ln -s /opt/nvim-linux-arm64/bin/nvim /usr/local/bin/nvim
