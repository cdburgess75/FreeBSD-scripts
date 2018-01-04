#!/bin/bash

# terminal colors
red="\033[0;31m"
green="\033[0:32m"
default="\033[0m"

# commands
update="freebsd-update"
pkg="pkg install"

# root check
if [[ "$(id -u)" != "0" ]]; then
  printf "${red}Install failed${default}: super user access required\n"
  printf "Please try agian as root\n"
  exit
fi

printf "${green}Starting Installation${default}\n"

# update system
printf "\nUpdateing system\n"
$update fetch
# $update install

# install packages
printf "\nInstalling packages\n"
$pkg chromium cmake \
     firefox fish fluxbox \
     ghc git \
     neovim \
     python \
     slim \
     tmux \
     xorg

printf "\n\n${green}All done${default}\n\n"
printf "We probably missed some things. Please be sure to update this script "
printf "as you add missing packages\n"

printf "Remember to configure dotfiles and other settings!\n\n\n"
