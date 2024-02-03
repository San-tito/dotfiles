#!/bin/bash

# Dotfiles Santito Install Script

# ANSI color variables
HEADER='\033[1;34m'
SUCCESS='\033[1;32m'
WARNING='\033[1;33m'
ERROR='\033[1;31m'
RESET='\033[0m'

# Header
printf "\n${HEADER}Dotfiles Santito Install Script${RESET}\n"

# Check if the dotfiles directory already exists
if [ -d "dotfiles" ]; then
    printf "${WARNING}The 'dotfiles' directory already exists. Aborting installation.${RESET}\n"
    exit 1
fi

# Clone dotfiles repository with submodules, log submodule updates
printf "${SUCCESS}Cloning dotfiles repository with submodules...${RESET}\n"
git clone --recurse-submodules https://github.com/San-tito/dotfiles 2> >(grep -E 'Cloning')

# Ask for confirmation to copy everything
echo -e "${WARNING}Do you want to copy all dotfiles to your home directory? (y/n): ${RESET}\c"
read -r REPLY

if [ "$REPLY" = "y" ] || [ "$REPLY" = "Y" ]; then
    # Copy dotfiles content to home directory
    printf "${SUCCESS}Copying dotfiles content to home directory...${RESET}\n"
    rsync -av --exclude="README.md" --exclude="LICENSE" --exclude=".gitmodules" --exclude=".git" dotfiles/ ~

    # Optionally, remove the cloned repository if desired
    # rm -rf dotfiles

    printf "${SUCCESS}Dotfiles installed successfully!${RESET}\n"
else
    printf "${ERROR}Installation canceled. No files were copied.${RESET}\n"
fi
