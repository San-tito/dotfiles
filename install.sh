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

# Clone dotfiles repository with submodules
printf "${SUCCESS}Cloning dotfiles repository with submodules...${RESET}\n"
git clone --recurse-submodules https://github.com/San-tito/dotfiles

# Ask for confirmation to copy everything
read -p "$(printf "${WARNING}Do you want to copy all dotfiles to your home directory? (y/n): ${RESET}")" -n 1 -r
echo    # Move to a new line after user input

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Copy dotfiles content to home directory
    printf "${SUCCESS}Copying dotfiles content to home directory...${RESET}\n"
    cp -r dotfiles/* ~

    # Optionally, remove the cloned repository if desired
    # rm -rf dotfiles

    printf "${SUCCESS}Dotfiles installed successfully!${RESET}\n"
else
    printf "${ERROR}Installation canceled. No files were copied.${RESET}\n"
fi
