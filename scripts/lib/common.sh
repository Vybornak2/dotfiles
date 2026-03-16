#!/usr/bin/env bash
set -euo pipefail

# Default source checkout workspace for repositories not tied to fixed runtime paths.
SRC_DIR="${SRC_DIR:-$HOME/src}"
INSTALL_TZ="${INSTALL_TZ:-Etc/UTC}"

print_header() {
  local text="$1"
  printf "\n==> %s\n" "$text"
}

log_info() {
  printf "[INFO] %s\n" "$1"
}

log_warn() {
  printf "[WARN] %s\n" "$1"
}

log_error() {
  printf "[ERROR] %s\n" "$1" >&2
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

apt_install() {
  if [[ $# -eq 0 ]]; then
    return 0
  fi
  sudo env DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true TZ="$INSTALL_TZ" apt-get install -y "$@"
}

apt_update() {
  sudo env DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true TZ="$INSTALL_TZ" apt-get update
}

apt_upgrade() {
  sudo env DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true TZ="$INSTALL_TZ" apt-get upgrade -y
}

run_module() {
  local module_path="$1"

  if [[ ! -f "$module_path" ]]; then
    log_error "Module not found: $module_path"
    exit 1
  fi

  print_header "Running $(basename "$module_path")"
  # shellcheck disable=SC1090
  source "$module_path"
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

ensure_timezone_noninteractive() {
  if [[ -f "/usr/share/zoneinfo/$INSTALL_TZ" ]]; then
    sudo ln -snf "/usr/share/zoneinfo/$INSTALL_TZ" /etc/localtime
    echo "$INSTALL_TZ" | sudo tee /etc/timezone >/dev/null
  else
    log_warn "Requested timezone not found: $INSTALL_TZ; falling back to Etc/UTC"
    INSTALL_TZ="Etc/UTC"
    sudo ln -snf "/usr/share/zoneinfo/$INSTALL_TZ" /etc/localtime
    echo "$INSTALL_TZ" | sudo tee /etc/timezone >/dev/null
  fi

  if dpkg -s tzdata >/dev/null 2>&1; then
    sudo env DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true TZ="$INSTALL_TZ" dpkg-reconfigure -f noninteractive tzdata >/dev/null 2>&1 || true
  fi

  log_info "Timezone configured for unattended installs: $INSTALL_TZ"
}
