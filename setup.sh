#!/bin/bash

# Set up XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CONFIG_HOME"/nixpkgs

# Pull recursive submodules
git submodule update --init
git pull --recurse-submodules

# Create symlinks for existing configurations
ln -sf "$PWD/config.nix" "$XDG_CONFIG_HOME"/nixpkgs/config.nix

# Install Nix packages from config.nix
nix-env -iA nixpkgs.dotfiles

echo "All packages have been installed."

# Make fish the default shell
# echo "Adding fish to /etc/shells..."
# echo "/home/vscode/.nix-profile/bin/fish" | sudo tee -a /etc/shells
# echo "Changing shell to fish..."
# sudo chsh -s /home/vscode/.nix-profile/bin/fish $USER

mkdir -p "$HOME/.config"
cp -r $PWD/* $HOME/.config

# cp $HOME/.config/tmux/tmux-devpod.conf $HOME/.config/tmux/tmux.conf
sed -i 's|/opt/homebrew/bin/fish|/home/vscode/.nix-profile/bin/fish|g' $HOME/.config/tmux/tmux.conf
export TERM=xterm-256color

echo "Setup complete."

exit 0
