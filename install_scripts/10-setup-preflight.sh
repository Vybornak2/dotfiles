#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

log_info "Preflight checks and environment discovery"
log_info "User: ${USER:-$(id -un)}"
log_info "Home: $HOME"
log_info "Working directory: $(pwd)"

if [[ ! -d "$HOME/.config" ]]; then
  mkdir -p "$HOME/.config"
  log_info "Created $HOME/.config"
fi

if [[ ! -d "$HOME/.local/bin" ]]; then
  mkdir -p "$HOME/.local/bin"
  log_info "Created $HOME/.local/bin"
fi

if [[ ! -d "$HOME/Projects" ]]; then
  mkdir -p "$HOME/Projects"
  log_info "Created $HOME/Projects"
fi

ensure_src_dir
log_info "Using source checkout directory: $SRC_DIR"

log_info "Updating apt package index"
sudo apt-get update

log_info "Upgrading installed packages"
sudo apt-get upgrade -y
