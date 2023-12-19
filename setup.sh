#!/bin/bash

	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
	tar -xzvf nvim-linux64.tar.gz
	sudo mv nvim-linux64 /usr/bin/
	rm -r nvim-linux64
cp -r nvim ~/.config/nvim

cp wallpapers/wp.jpg ~/Pictures/wp.jpg


echo ""
echo "Setup completed."
