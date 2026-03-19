#!/usr/bin/env bash

NVIM_SRC_DIR="$SRC_DIR/neovim"

log_info "Installing Neovim from source (stable branch)"
if [[ ! -d "$NVIM_SRC_DIR/.git" ]]; then
  git clone --depth=1 --branch stable https://github.com/neovim/neovim.git "$NVIM_SRC_DIR"
else
  git -C "$NVIM_SRC_DIR" fetch --depth=1 origin stable
  git -C "$NVIM_SRC_DIR" checkout stable
  git -C "$NVIM_SRC_DIR" pull --ff-only origin stable
fi

log_info "Building and installing Neovim"
pushd "$NVIM_SRC_DIR" >/dev/null
make distclean >/dev/null 2>&1 || true
make CMAKE_BUILD_TYPE=Release
sudo make install
popd >/dev/null

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
    log_warn "npm not found; skipping tree-sitter CLI install (run 26-deps-node.sh first)."
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
"$PY_HOST_BIN" -m pip install pynvim
