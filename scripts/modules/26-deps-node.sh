#!/usr/bin/env bash

NVM_VERSION="v0.40.4"
NODE_VERSION="22"
export NVM_DIR="$HOME/.nvm"

if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
  log_info "Installing nvm ($NVM_VERSION)"
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash
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

log_info "Installing Node.js $NODE_VERSION via nvm"
nvm install "$NODE_VERSION"
nvm alias default "$NODE_VERSION"
nvm use "$NODE_VERSION"

log_info "Active Node.js version: $(node -v)"
log_info "Active npm version: $(npm -v)"
