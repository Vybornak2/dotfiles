#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

log_info "Installing font dependencies"
sudo apt-get install -y fonts-jetbrains-mono

FONT_TARGET_DIR="$HOME/.local/share/fonts/JetBrainsMonoNerd"
if [[ ! -d "$FONT_TARGET_DIR" ]]; then
  log_info "Installing JetBrainsMono Nerd Font"
  FONT_SRC_DIR="$SRC_DIR/fonts"
  FONT_ZIP="$FONT_SRC_DIR/JetBrainsMono.zip"
  mkdir -p "$FONT_SRC_DIR"
  curl -fsSL -o "$FONT_ZIP" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
  mkdir -p "$FONT_TARGET_DIR"
  unzip -q "$FONT_ZIP" -d "$FONT_TARGET_DIR"
  fc-cache -f "$HOME/.local/share/fonts" || true
else
  log_info "JetBrainsMono Nerd Font already installed"
fi
