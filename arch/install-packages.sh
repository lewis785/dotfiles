#!/bin/bash

packages=(
  aws-cli
  atuin
  bat
  curl
  eza
  fzf
  git
  jq
  pandoc
  spotify-launcher
  tmux
  vim
  zsh
  ttf-hack-nerd
  discord
  steam
  signal-desktop

)
lazy_vim=(
  neovim
  ripgrep
  fd
  lazygit
  unzip
)

function install_package() {
  if pacman -Qi "$1" &>/dev/null; then
    echo "Already installed: $1"
  else
    echo ">>> Installing $1"
    sudo pacman -S --needed --noconfirm "$1"
    echo ""
  fi
}

for i in "${packages[@]}" "${lazy_vim[@]}"; do
  install_package "$i"
done
