#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

log_info "Cleaning apt cache and unused packages"
sudo apt-get autoremove -y
sudo apt-get autoclean -y

if command -v docker >/dev/null 2>&1; then
  log_info "Docker package installed; remember to re-login before running docker without sudo"
fi

log_info "Cleanup complete"
