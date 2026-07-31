#!/bin/bash

dotfileDir=$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )

linkDotfile() {
  dest="${HOME}/${2}"
  src="${dotfileDir}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${2} ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}
  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest} "${dest}-${dateStr}"

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest} "${dest}-${dateStr}"
  fi

  echo "Creating new symlink: ${src} --> ${dest}"
  ln -s ${src} ${dest}
}

linkDotfile git/gitconfig .gitconfig
linkDotfile zsh/zshrc .zshrc
linkDotfile zsh/zshenv .zshenv
linkDotfile zsh/p10k.zsh .p10k.zsh
linkDotfile tmux/tmux.conf .tmux.conf
linkDotfile neovim .config/nvim
