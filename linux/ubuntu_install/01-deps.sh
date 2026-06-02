#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

log_info "Installing apt packages"

mkdir -p "$HOME/.config" "$HOME/.local/bin" "$HOME/Projects" "$SRC_DIR"

sudo apt-get update
xargs sudo apt-get -y install < "$SCRIPT_DIR/packages.txt"
