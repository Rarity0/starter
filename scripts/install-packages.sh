#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
PARENT_DIR=$(dirname "$SCRIPT_DIR")
PACKAGE_FILE="$PARENT_DIR/packages.txt"

if [[ $EUID -ne 0 ]]; then
    echo "Installing essential packages..."
    sudo pacman -S --needed $(grep -v '^#' $PACKAGE_FILE)
else
    echo "Please run the script as non-root."
    exit 1
fi