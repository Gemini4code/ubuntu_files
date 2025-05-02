#!/bin/bash

#Installing various softwares
sudo apt update && sudo apt install nano fzf tmux bpytop htop lsd gdu entr neofetch bat tldr -y
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ $? == 0 ]
then
	echo "nano, fzf, tmux, bpytop, lsd, gdu, git, entr, unzip, ripgrep, and neofetch successfully installed..."
else
	echo "installation encountered an error. Please try again!"
fi

#Warpify subshell
#echo "printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash"}}\x9c'" >> ~/.bashrc

#Include date and time to bash history
echo "export HISTTIMEFORMAT='[%F %T] '" >> ~/.bashrc
echo "alias stop='sudo halt -p'" >> ~/.bashrc
echo "alias ls='lsd'" >> ~/.bashrc
echo "alias ga='git add .'" >> ~/.bashrc
echo "alias gc='git commit -m '" >> ~/.bashrc
echo "alias gp='git push'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc
echo "alias btop='bpytop'" >> ~/.bashrc
echo "alias cat='bat'" >> ~/.bashrc

echo "printf '\\eP\$f{\"hook\": \"SourcedRcFileForWarp\", \"value\": { \"shell\": \"bash\"}}\\x9c'" >> ~/.bashrc


#source .bashrc
if [ $? == 0 ]
then
  echo "SUBSHELL SUCCESSFULLY WARPIFIED!!!!!!!!!"
else
  echo "WARPIFICATION FAILED, PLEASE MANUALLY WARPIFY.........."
fi

#echo "Hurray!!! Subshell successfully warpified"

#Create a nanorc file to configure nano editor
cp /usr/share/doc/nano/examples/sample.nanorc $HOME/.nanorc
#echo "nanorc copied to home directory. You can now configure nano editor..."

#Install nvim and copy its config file to $HOME/.config/nvim/
sudo cp ubuntu_files/nvim-linux-arm64.tar.gz /usr/bin && cd /usr/bin && sudo tar xzvf nvim-linux-arm64.tar.gz && sudo rm nvim-linux-arm64.tar.gz && sudo ln -s ./nvim-linux-arm64/bin/nvim ./nvim

#sudo apt install neovim -y

if [ -d "$HOME/.config" ]
then
  git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
else
	mkdir $HOME/.config && git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
fi

#cp ubuntu_files/plugins.lua .config/nvim/lua/custom/

if [$? == 0]
then
  echo "Nvchad customs folder configured"
else
  echo "error setting up Nvchad customs folder"
fi

if [ $? == 0 ]
then
  echo "nano, fzf, tmux, bpytop, htop, lsd, gdu, entr, unzip, nodejs, ripgrep, neofetch and npm successfully installed"
  #echo "subshell successfully warpified"
  echo "nanorc copied to home directory. You can now configure nano editor..."
  echo "date and time now included in history"
  echo "lsd, stop, and git aliases added to .bashrc"
  echo "Neovim successfully installed"
  echo "Nvchad with all default configurations including lazy.nvim, numerous plugins and LSPs installed..."
else
  echo "Error occured when installing Neovim and lazy.nvim"
fi

#mkdir ~/.config/tmux/ && cp ubuntu_files/tmux.conf ~/.tmux.conf && cp ubuntu_files/tmux.keys.conf ~/.config/tmux/tmux.keys.conf

#if [ $? == 0 ]
#then
#  echo "tmux sessionX with all its dependencies including tmux plugin manager, fzf, and bat installed"
#else
#	echo "Error configuring tmux!"
#fi

#source .bashrc
