#!/usr/bin/env bash

log_info "Installing font dependencies"
apt_install fonts-jetbrains-mono

FONT_TARGET_DIR="$HOME/.local/share/fonts/JetBrainsMonoNerd"
if [[ ! -d "$FONT_TARGET_DIR" ]]; then
  log_info "Installing JetBrainsMono Nerd Font"
  tmp_dir="$(mktemp -d)"
  curl -fsSL -o "$tmp_dir/JetBrainsMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
  mkdir -p "$FONT_TARGET_DIR"
  unzip -q "$tmp_dir/JetBrainsMono.zip" -d "$FONT_TARGET_DIR"
  rm -rf "$tmp_dir"
  fc-cache -f "$HOME/.local/share/fonts" || true
else
  log_info "JetBrainsMono Nerd Font already installed"
fi
