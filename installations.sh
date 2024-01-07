#!/bin/bash

#Installing various softwares
sudo apt update && sudo apt install nano bpytop lsd gdu git nodejs -y

if [ $? == 0 ]
then
	echo "Nano, Bpytop, Lsd, Gdu, Git and Nodejs successfully installed..."
else
	echo "installation encountered an error. Please try again!"
fi

#Warpify subshell
echo "printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash"}}\x9c'" >> ~/.bashrc

source .bashrc

echo "Hurray!!! Subshell successfully warpified"

#Create a nanorc file to configure nano editor
cp /usr/share/doc/nano/examples/sample.nanorc $HOME/.nanorc
echo "nanorc copied to home directory. You can now configure nano editor..."

#Install nvim and copy its config file to $HOME/.config/nvim/
sudo cp /mnt/mac/Users/arnoldsmac/Desktop/Ubuntu_files/nvim-linux64.tar.gz /usr/bin && cd /usr/bin && sudo tar xzvf nvim-linux64.tar.gz && sudo rm nvim-linux64.tar.gz && sudo ln -s ./nvim-linux64/bin/nvim ./nvim

if [ -d "$HOME/.config" ]
then
	cp -R /mnt/mac/Users/arnoldsmac/Desktop/Ubuntu_files/nvim/ $HOME/.config/
else
	mkdir $HOME/.config  && cp -R /mnt/mac/Users/arnoldsmac/Desktop/Ubuntu_files/nvim/ $HOME/.config/
fi

if [ $? == 0 ]
then
	echo "Neovim successfully installed and lazy.nvim with plugins successfully configured..."
else
	echo "Error occured when installing Neovim and lazy.nvim"
fi

echo "Done..."
