#!/usr/bin/env bash

log_info "Installing extra CLI tools"
apt_install bat shellcheck

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

log_info "Installing GitHub CLI"
apt_install gh

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
  npm install -g @githubnext/github-copilot-cli || true
else
  log_warn "npm not found; skipping Gemini CLI and GitHub Copilot CLI (run 26-deps-node.sh first)"
fi
