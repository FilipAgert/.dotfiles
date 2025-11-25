#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles/setup"

echo "Linking dotfiles from $DOTFILES_DIR to $HOME"

for file in "$DOTFILES_DIR"/.*; do
    filename=$(basename "$file")

    # skip current dir (.) and parent dir (..)
    [[ "$filename" == "." || "$filename" == ".." ]] && continue

    # Skip .gitconfig.local for symlinking
    if [[ "$filename" == ".gitconfig_local" ]]; then
        echo "Copying $filename to home directory instead of symlinking"
        cp "$file" "$HOME/$filename"
        echo "Opening $filename in vim to edit your name and email"
        vim "$HOME/$filename"
        continue
    fi

    target="$HOME/$filename"

    if [[ -L "$target" || -f "$target" ]]; then
        echo "Backing up existing $filename to $filename.bak"
        mv "$target" "$target.bak"
    fi

    

    echo "Creating symlink for $filename"
    ln -s "$file" "$target"
done
target="$HOME/.config/nvim/init.vim"
file="$DOTFILES_DIR/init.vim"
if [[ -L "$target" || -f "$target" ]]; then
        echo "Backing up existing $target to $target.bak"
        mv "$target" "$target.bak"
fi
mkdir -p "$(dirname "$target")"
ln -s "$file" "$target"
echo "Creating symlink for $file"
source ~/.bashrc
echo "Dotfiles setup complete."


# Setup lazy neovim
CONFIG_DIR="$HOME/.config/nvim/lua/config"
mkdir -p "$CONFIG_DIR"
cp "$DOTFILES_DIR/lazy.lua" "$CONFIG_DIR/"
