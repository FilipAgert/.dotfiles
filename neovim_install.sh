#!/usr/bin/env bash
# download neovim appimage from github.com/neovim/neovim/releases
set -e 

INSTALL_DIR="$HOME/nvim-linux64"
NVIM_URL="https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.appimage"
NVIM_PATH="$INSTALL_DIR/nvim.appimage"

mkdir -p "$INSTALL_DIR"

echo "downloading neovim v0.11.4"
curl -L "$NVIM_URL" -o "$NVIM_PATH"

chmod u+x "$NVIM_PATH"

"$NVIM_PATH" --appimage-extract #extract appimage
mv squashfs-root "$INSTALL_DIR/nvim-app" #rename folder

#cleanup files
rm "$INSTALL_DIR/nvim.appimage"
echo "neovim v0.11.4 installed!"
