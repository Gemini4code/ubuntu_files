#!/bin/bash

#Installing various softwares
sudo apt update && sudo apt install nano bpytop lsd gdu git -y

if [ $? == 0 ]
then
	echo "Nano, Bpytop, Lsd, Gdu and Git successfully installed..."
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

# if [ -d "$HOME/.config" ]
# then
# 	mkdir $HOME/.config/nvim && cp /mnt/mac/Users/arnoldsmac/Desktop/Ubuntu_files/init.vim $HOME/.config/nvim/init.vim
# else
# 	mkdir $HOME/.config $HOME/.config/nvim && cp /mnt/mac/Users/arnoldsmac/Desktop/Ubuntu_files/init.vim $HOME/.config/nvim/init.vim
# fi

# if [ $? == 0 ]
# then
# 	echo "Neovim successfully installed..."
# else
# 	echo "Error occured when installing Neovim"
# fi

#Install vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# if [ $? == 0 ]
# then
# 	echo "Vim-plug successfully installed..."
# fi


echo "Done..."
