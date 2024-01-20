#!/bin/bash

#Installing various softwares
sudo apt update && sudo apt install nano bpytop lsd gdu git nodejs entr unzip npm ripgrep -y

if [ $? == 0 ]
then
	echo "nano, bpytop, lsd, gdu, git, entr, unzip, ripgrep, npm, and nodejs successfully installed..."
else
	echo "installation encountered an error. Please try again!"
fi

#Warpify subshell
echo "printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash"}}\x9c'" >> ~/.bashrc

#Include date and time to bash history
echo "export HISTTIMEFORMAT='[%F %T] '" >> ~/.bashrc
echo "alias ls='lsd'" >> ~/.bashrc
echo "alias stop='sudo halt -p'" >> ~/.bashrc
echo "alias ga='git add .'" >> ~/.bashrc
echo "alias gc='git commit -m'" >> ~/.bashrc
echo "alias gp='git push'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc


source .bashrc

echo "Hurray!!! Subshell successfully warpified"

#Create a nanorc file to configure nano editor
cp /usr/share/doc/nano/examples/sample.nanorc $HOME/.nanorc
echo "nanorc copied to home directory. You can now configure nano editor..."

#Install nvim and copy its config file to $HOME/.config/nvim/
sudo cp /mnt/mac/Users/arnoldsmac/Desktop/Ubuntu_files/nvim-linux64.tar.gz /usr/bin && cd /usr/bin && sudo tar xzvf nvim-linux64.tar.gz && sudo rm nvim-linux64.tar.gz && sudo ln -s ./nvim-linux64/bin/nvim ./nvim

if [ -d "$HOME/.config" ]
then
	cp -R $HOME/ubuntu_files/nvim $HOME/.config/
else
	mkdir $HOME/.config && cp -R $HOME/ubuntu_files/nvim $HOME/.config/
fi

if [ $? == 0 ]
then
  echo "nano, bpytop, lsd, gdu, git, entr, unzip, nodejs, ripgrep, and npm successfully installed"
  echo "subshell successfully warpified"
  echo "date and time now included in history"
  echo "lsd, stop, and git aliases added to .bashrc"
	echo "Neovim successfully installed" 
  echo "lazy.nvim with all essential plugins including LSP's successfully installed and configured..."
else
	echo "Error occured when installing Neovim and lazy.nvim"
fi

echo "Done..."
