#!/bin/bash

echo -e "\n===Setting up symlinks===\n"
../common/symlink.sh


echo -e "\n===Installing packages===\n"
./install-packages.sh


echo -e "\n===Setting up zsh===\n"
../common/setup-zsh.sh
