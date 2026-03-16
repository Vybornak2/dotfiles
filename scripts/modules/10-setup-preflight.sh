#!/usr/bin/env bash

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

ensure_timezone_noninteractive
