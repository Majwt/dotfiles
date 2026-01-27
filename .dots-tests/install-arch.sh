#!/usr/bin/env bash
set -e

# Update package database
echo "=== Updating package database ==="
sudo pacman -Sy --noconfirm


# Install base packages from list
echo "=== Installing packages from packages.txt ==="
xargs -a /tmp/packages.txt sudo pacman -S --noconfirm

# Install yay from AUR
echo "=== Installing yay ==="
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd /
rm -rf /tmp/yay


# eza -lah $HOME

cd $HOME
echo "=== Pulling from omarchy ==="
git clone --bare https://github.com/majwt/dots.git $HOME/.cfg
git --git-dir=$HOME/.cfg --work-tree=$HOME checkout -f
git --git-dir=$HOME/.cfg --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.cfg --work-tree=$HOME submodule update --init --recursive

# Launch an interactive shell
exec bash -l

