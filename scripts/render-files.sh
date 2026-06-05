#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
PARENT_DIR=$(dirname "$SCRIPT_DIR")
CONFIG_SRC="$(cd "$(dirname "$0")/../config" && pwd)"

mkdir -p "$HOME/.config"

for dir in "$CONFIG_SRC"/*/; do
    rsync -av --delete --exclude='.git' "$dir" "$HOME/.config/$(basename "$dir")/"
done

cp $PARENT_DIR/home/.xinitrc $HOME/.xinitrc