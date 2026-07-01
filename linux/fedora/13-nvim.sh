#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

ensure_base_tools

if command -v nvim >/dev/null 2>&1; then
  NVIM_VERSION="$(nvim --version | awk 'NR==1 {print $2}')"
  log_info "Neovim installed: $NVIM_VERSION"
else
  log_error "Neovim installation failed or nvim not on PATH."
  exit 1
fi


if ! command -v tree-sitter >/dev/null 2>&1; then
  log_info "Installing tree-sitter CLI"
  if command -v npm >/dev/null 2>&1; then
    npm install -g tree-sitter-cli
  else
    log_warn "npm not found; skipping tree-sitter CLI install."
  fi
else
  log_info "tree-sitter CLI already installed"
fi

log_info "Preparing Neovim Python host environment"
PY_HOST_DIR="$HOME/.local/share/nvim/venv_py"
PY_HOST_BIN="$PY_HOST_DIR/bin/python"

if [[ ! -x "$PY_HOST_BIN" ]]; then
  python3 -m venv "$PY_HOST_DIR"
fi

"$PY_HOST_BIN" -m pip install --upgrade pip
"$PY_HOST_BIN" -m pip install pynvim pylatexenc
