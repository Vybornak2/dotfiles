#!/usr/bin/env bash
set -euo pipefail

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

ensure_src_dir

LIBTEX_SRC_DIR="$SRC_DIR/libtexprintf"

if [[ ! -d "$LIBTEX_SRC_DIR/.git" ]]; then
  log_info "Cloning libtexprintf into $LIBTEX_SRC_DIR"
  git clone --depth 1 https://github.com/bartp5/libtexprintf.git "$LIBTEX_SRC_DIR"
else
  log_info "libtexprintf source already present: $LIBTEX_SRC_DIR"
fi

if ! command -v utftex >/dev/null 2>&1; then
  log_info "Building and installing utftex"

  if [[ ! -x "$LIBTEX_SRC_DIR/configure" ]]; then
    log_info "Bootstrapping libtexprintf build files"
    (
      cd "$LIBTEX_SRC_DIR"
      sh autogen.sh
    )
  fi

  (
    cd "$LIBTEX_SRC_DIR"
    ./configure
    make -j"$(nproc)"
  )
  sudo make -C "$LIBTEX_SRC_DIR" install
  sudo ldconfig
else
  log_info "utftex already installed"
fi

if ! command -v utftex >/dev/null 2>&1; then
  log_error "utftex installation failed"
  exit 1
fi

utftex '\frac{\alpha}{\beta+x}' >/dev/null
log_info "Verified utftex is available"
