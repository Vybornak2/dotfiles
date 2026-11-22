#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

if command -v gh >/dev/null 2>&1; then
  log_info "Installing GitHub CLI zsh completion"
  sudo install -d -m 0755 /usr/local/share/zsh/site-functions
  gh completion -s zsh | sudo tee /usr/local/share/zsh/site-functions/_gh >/dev/null
else
  log_warn "gh not found; skipping GitHub CLI zsh completion"
fi

if command -v npm >/dev/null 2>&1; then
  log_info "Installing GitHub Copilot CLI via npm"
  npm install -g @github/copilot || true
else
  log_warn "npm not found; skipping Gemini CLI and GitHub Copilot CLI (ensure nodejs/npm are installed by the dnf step)"
fi
