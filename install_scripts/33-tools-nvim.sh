#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

version_ge() {
  local current="${1#v}"
  local required="${2#v}"

  [[ "$(printf '%s\n%s\n' "$required" "$current" | sort -V | head -n1)" == "$required" ]]
}

install_nvim_release() {
  log_info "Installing latest Neovim release"
  NVIM_SRC_DIR="$SRC_DIR/nvim"
  NVIM_ARCHIVE="$NVIM_SRC_DIR/nvim-linux-x86_64.tar.gz"
  mkdir -p "$NVIM_SRC_DIR"
  curl -fsSL -o "$NVIM_ARCHIVE" https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo rm -rf /opt/nvim-linux-x86_64
  sudo tar -C /opt -xzf "$NVIM_ARCHIVE"
  sudo ln -sfn /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  rm -f "$NVIM_ARCHIVE"
}

if ! command -v nvim >/dev/null 2>&1; then
  install_nvim_release
else
  NVIM_VERSION="$(nvim --version | awk 'NR==1 {print $2}')"
  if ! version_ge "$NVIM_VERSION" "0.12.0"; then
    log_info "Upgrading Neovim from $NVIM_VERSION"
    install_nvim_release
    NVIM_VERSION="$(nvim --version | awk 'NR==1 {print $2}')"
  else
    log_info "Neovim already installed: $NVIM_VERSION"
  fi
fi

NVIM_VERSION="$(nvim --version | awk 'NR==1 {print $2}')"
if ! version_ge "$NVIM_VERSION" "0.12.0"; then
  log_error "Neovim $NVIM_VERSION is too old; 0.12.0 or newer is required."
  exit 1
fi
log_info "Verified Neovim version: $NVIM_VERSION"

if ! command -v tree-sitter >/dev/null 2>&1; then
  log_info "Installing tree-sitter CLI"
  if ! command -v npm >/dev/null 2>&1 && [[ -s "$HOME/.nvm/nvm.sh" ]]; then
    export NVM_DIR="$HOME/.nvm"
    # shellcheck disable=SC1090
    . "$NVM_DIR/nvm.sh"
    nvm use --silent default >/dev/null 2>&1 || true
  fi

  if command -v npm >/dev/null 2>&1; then
    npm install -g tree-sitter-cli
  else
    log_warn "npm not found; skipping tree-sitter CLI install (run 30-tools-node.sh first)."
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
