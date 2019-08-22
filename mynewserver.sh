#!/bin/bash
# Grundinstallation eines neuen Linux-Servers

cd
echo "apt update"
apt update
echo "apt upgrade"
apt upgrade -y
echo "apt install needed software"
apt install -y dialog nano zip unzip wget curl htop git sudo screen neofetch zsh
echo "setup neofetch"
cd .config/neofetch
mv config.conf config.conf.bak
wget -O config.conf https://raw.githubusercontent.com/fachinformatiker/dotfiles/master/.config/neofetch/config
echo "install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
echo "setup oh my zsh"
cd
echo "if [ -f /usr/bin/neofetch ]; then neofetch; fi" >> .zshrc
sed -i 's/robbyrussell/geoffgarside/g' .zshrc
dialog --title 'Server' --msgbox 'Ich habe fertig' 5 20
