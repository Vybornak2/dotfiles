#!/usr/bin/env bash
set -euo pipefail

# Default source checkout workspace for repositories not tied to fixed runtime paths.
SRC_DIR="${SRC_DIR:-$HOME/src}"
LOG_FD="${LOG_FD:-1}"
LOG_ERR_FD="${LOG_ERR_FD:-2}"

PATH="$HOME/.local/bin:$PATH"
export PATH

print_header() {
  local text="$1"
  printf "\n==> %s\n" "$text" >&"$LOG_FD"
}

log_info() {
  printf "[INFO] %s\n" "$1" >&"$LOG_FD"
}

log_warn() {
  printf "[WARN] %s\n" "$1" >&"$LOG_FD"
}

log_error() {
  printf "[ERROR] %s\n" "$1" >&"$LOG_ERR_FD"
}

ensure_supported_os() {
  if [[ ! -f /etc/os-release ]]; then
    log_error "Cannot detect OS (/etc/os-release missing)."
    exit 1
  fi

  # shellcheck disable=SC1091
  source /etc/os-release
  if [[ "${ID:-}" != "ubuntu" && "${ID:-}" != "pop" ]]; then
    log_error "This installer currently targets Ubuntu/Pop!_OS only. Detected: ${ID:-unknown}"
    exit 1
  fi
}

ensure_sudo() {
  if ! command -v sudo >/dev/null 2>&1; then
    log_error "sudo is required but not installed."
    exit 1
  fi

  if ! sudo -v; then
    log_error "sudo authentication failed."
    exit 1
  fi
}

ensure_line_in_file() {
  local line="$1"
  local file="$2"

  touch "$file"
  if ! grep -Fqx "$line" "$file"; then
    printf "%s\n" "$line" >> "$file"
  fi
}

ensure_src_dir() {
  if [[ ! -d "$SRC_DIR" ]]; then
    mkdir -p "$SRC_DIR"
    log_info "Created source directory: $SRC_DIR"
  else
    log_info "Source directory already exists: $SRC_DIR"
  fi
}
