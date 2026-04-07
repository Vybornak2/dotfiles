#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

if ! command -v bat >/dev/null 2>&1 || ! command -v shellcheck >/dev/null 2>&1; then
  log_info "Installing extra CLI tools"
  sudo apt-get install -y bat shellcheck
else
  log_info "bat and shellcheck already installed"
fi

UV_BIN="$(command -v uv || true)"
if [[ -z "$UV_BIN" && -x "$HOME/.local/bin/uv" ]]; then
  UV_BIN="$HOME/.local/bin/uv"
fi

if [[ -n "$UV_BIN" ]]; then
  log_info "Installing Python developer tools via uv"
  "$UV_BIN" tool install ruff || true
  "$UV_BIN" tool install mypy || true
  "$UV_BIN" tool install ty || true
  "$UV_BIN" tool install isort || true
  "$UV_BIN" tool install pyright || true
  "$UV_BIN" tool install pytest || true
  "$UV_BIN" tool install ipython || true
else
  log_warn "uv not found; skipping uv tool installs"
fi

if ! command -v gh >/dev/null 2>&1; then
  log_info "Installing GitHub CLI"
  sudo apt-get install -y gh
else
  log_info "GitHub CLI already installed"
fi

if command -v gh >/dev/null 2>&1; then
  log_info "Installing GitHub CLI zsh completion"
  sudo install -d -m 0755 /usr/local/share/zsh/site-functions
  gh completion -s zsh | sudo tee /usr/local/share/zsh/site-functions/_gh >/dev/null
else
  log_warn "gh not found; skipping GitHub CLI zsh completion"
fi

# Load npm from nvm if needed
if ! command -v npm >/dev/null 2>&1 && [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1090
  . "$NVM_DIR/nvm.sh"
  nvm use --silent default >/dev/null 2>&1 || true
fi

if command -v npm >/dev/null 2>&1; then
  log_info "Installing Gemini CLI via npm"
  npm install -g @google/gemini-cli || true

  log_info "Installing GitHub Copilot CLI via npm"
  npm install -g @github/copilot || true
else
  log_warn "npm not found; skipping Gemini CLI and GitHub Copilot CLI (run 30-tools-node.sh first)"
fi
