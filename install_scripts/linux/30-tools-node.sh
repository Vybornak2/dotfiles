#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

export NVM_DIR="$HOME/.nvm"

if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
  log_info "Installing nvm (latest)"
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash
else
  log_info "nvm already installed"
fi

if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  # shellcheck disable=SC1090
  . "$NVM_DIR/nvm.sh"
else
  log_error "nvm installation completed but $NVM_DIR/nvm.sh was not found."
  exit 1
fi

log_info "Installing latest Node.js via nvm"
nvm install node
nvm alias default node
nvm use node

log_info "Active Node.js version: $(node -v)"
log_info "Active npm version: $(npm -v)"
