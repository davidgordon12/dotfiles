#!/bin/bash

host=$1
distro=$2

if [ $# -ne 2 ]; then
  echo "Invalid arguments. Expected 1, got $#"
  echo "Please provide a host." 
  echo "Usage: ./setup.sh [Desktop|Macbook|Beelink] [Fedora|Debian|Arch]"
  exit 1
fi

echo "You may be prompted for your root password."


if [ $distro = "Debian" ]; then
	sudo cp -r fonts/BitstreamVeraSansMono/ /usr/share/fonts/truetype/
elif [ $distro = "Fedora" ]; then
	sudo cp -r fonts/BitstreamVeraSansMono/ /usr/share/fonts/
elif [ $distro = "Arch" ]; then
	sudo mkdir -p /usr/local/share/fonts
	sudo cp -r fonts/BitstreamVeraSansMono/ /usr/share/local/fonts
else
	echo "Unsupported distro."
	exit 1
fi

# Install packages
if [ $distro = "Debian" ]; then
	sudo apt-get install feh rofi brightnessctl
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
	tar -xzvf nvim-linux64.tar.gz
	sudo mv nvim-linux64 /usr/bin/
	rm -r nvim-linux64
elif [ $distro = "Fedora" ]; then
	sudo yum install feh rofi neovim
elif [ $distro = "Arch" ]; then
	sudo pacman -S feh rofi neovim
else
	echo "Unsupported distro."
	exit 1
fi

# Copy folders
cp -r nvim ~/.config/nvim
cp i3/config ~/.config/i3/config
mkdir -p ~/.config/i3status
cp i3status/config ~/.config/i3status/config
cp -r rofi ~/.config/
cp .Xresources ~/
cp .bashrc ~/

cp wallpapers/wp.jpg ~/Pictures/wp.jpg

# Commands
feh --bg-fill ~/Pictures/wp.jpg
fc-cache -fv

echo ""
echo "Setup completed."
