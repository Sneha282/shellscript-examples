#!/bin/bash
packages=( "$1" "$2" )
for package in "${packages[@]}" ; do
    sudo apt-get install -y "$package"
done
echo "packages installed successfully"
