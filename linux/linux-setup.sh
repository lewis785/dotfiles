#!/bin/bash

echo "\n===Setting up symlinks===\n"
../common/symlink.sh

echo "\n===Installing programs===\n"

sudo apt install \
	awscli \
	bat\
	curl\
	exa\
	fzf \
	git \
	pandoc\
	vim \
	-y

echo "\n===Installing applications===\n"

sudo apt install firefox -y
sudo snap install --classic code
sudo snap install vlc
sudo snap install spotify
./install-obsidian.sh


echo "\n===Install Docker===\n"
./install-docker.sh

echo "\n===Updating settings===\n"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true

echo "\n===Setting up zsh===\n"
if ! command -v zsh &> /dev/null
then
	sudo apt install zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	chsh -s $(which zsh)
fi

echo "\n===Custom Install===\n"
../common/install-volta.sh

echo "\n===Add Fonts===\n"
./add-hack-font.sh
