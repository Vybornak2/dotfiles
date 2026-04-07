#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

log_info "Configuring Kitty as the default terminal"

if ! command -v kitty >/dev/null 2>&1; then
  log_warn "kitty not found; skipping terminal configuration"
  exit 0
fi

if ! command -v gsettings >/dev/null 2>&1 || [[ -z "${DBUS_SESSION_BUS_ADDRESS:-}" && -z "${DISPLAY:-}" && -z "${WAYLAND_DISPLAY:-}" ]]; then
  log_warn "No desktop session or gsettings missing; skipping terminal configuration"
  exit 0
fi

if gsettings list-schemas | grep -qx "org.gnome.desktop.default-applications.terminal"; then
  gsettings set org.gnome.desktop.default-applications.terminal exec "kitty" || log_warn "Failed to set GNOME default terminal exec"
  gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-e" || log_warn "Failed to set GNOME default terminal exec-arg"
  log_info "GNOME default terminal command set to kitty"
else
  log_warn "GNOME terminal default schema not found; skipping default terminal gsettings"
fi
