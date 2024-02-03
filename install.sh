#!/bin/bash

# Dotfiles Santito Install Script

# ANSI Color Variables
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[1;31m'
RESET='\033[0m'

# Header
echo -e "\n${BLUE}Dotfiles Santito Install Script${RESET}\n"

# Clone dotfiles repository with submodules
echo -e "${GREEN}Cloning dotfiles repository with submodules...${RESET}"
git clone --recurse-submodules https://github.com/San-tito/dotfiles

# Ask for confirmation to copy everything
read -p $'\033[1;33mDo you want to copy all dotfiles to your home directory? (y/n): \033[0m' -n 1 -r
echo    # Move to a new line after user input

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Copy dotfiles content to home directory
    echo -e "${GREEN}Copying dotfiles content to home directory...${RESET}"
    cp -r dotfiles/* ~

    # Optionally, remove the cloned repository if desired
    # rm -rf dotfiles

    echo -e "${GREEN}Dotfiles installed successfully!${RESET}"
else
    echo -e "${RED}Installation canceled. No files were copied.${RESET}"
fi
