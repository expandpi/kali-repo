#!/bin/bash

if (($EUID != 0 )); then
	echo "Run this script as root"
	exit
fi

RED='\033[0;31m'

echo -e "${RED}Updating System"
sudo apt update && sudo apt upgrade -y


echo -e "${RED}Adding Kali Repo"
sudo sh -c "echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list"


echo -e "${RED}Installing gnupg"
sudo apt install -y gnupg

wget 'https://archive.kali.org/archive-key.asc'
sudo apt-key add archive-key.asc

sudo apt update


echo "nearly done"

sudo sh -c "echo 'Package: *'>/etc/apt/preferences.d/kali.pref; echo 'Pin: release a=kali-rolling'>>/etc/apt/preferences.d/kali.pref; echo 'Pin-Priority: 50'>>/etc/apt/preferences.d/kali.pref"


echo "Done"

echo -e "${RED}Check it by installing gobuster and dirsearch"

echo -e "${RED}gobuster: sudo apt install gobuster"
BOLD=$(tput bold)

echo -e "${RED}dirsearch: sudo apt install dirsearch"

