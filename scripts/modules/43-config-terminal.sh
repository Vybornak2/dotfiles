#!/usr/bin/env bash

log_info "Configuring Kitty as the default terminal"

if command -v kitty >/dev/null 2>&1; then
  kitty_bin="$(command -v kitty)"

  if command -v update-alternatives >/dev/null 2>&1 && update-alternatives --query x-terminal-emulator >/dev/null 2>&1; then
    if sudo update-alternatives --set x-terminal-emulator "$kitty_bin" >/dev/null 2>&1; then
      log_info "Set x-terminal-emulator to $kitty_bin"
    else
      log_warn "Could not set x-terminal-emulator to kitty"
    fi
  else
    log_warn "x-terminal-emulator alternative not found; skipping alternatives switch"
  fi
else
  log_warn "kitty not found; skipping default terminal configuration"
fi

if ! command -v gsettings >/dev/null 2>&1; then
  log_warn "gsettings not found; skipping Pop!_OS keybinding setup"
  return 0
fi

if [[ -z "${DBUS_SESSION_BUS_ADDRESS:-}" && -z "${DISPLAY:-}" && -z "${WAYLAND_DISPLAY:-}" ]]; then
  log_warn "No desktop session detected; skipping gsettings terminal/keybinding setup"
  return 0
fi

if gsettings list-schemas | grep -qx "org.gnome.desktop.default-applications.terminal"; then
  gsettings set org.gnome.desktop.default-applications.terminal exec "kitty" || log_warn "Failed to set GNOME default terminal exec"
  gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-e" || log_warn "Failed to set GNOME default terminal exec-arg"
  log_info "GNOME default terminal command set to kitty"
else
  log_warn "GNOME terminal default schema not found; skipping default terminal gsettings"
fi

KB_SCHEMA="org.gnome.settings-daemon.plugins.media-keys"
KB_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
KB_SUBSCHEMA="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${KB_PATH}"

if gsettings list-schemas | grep -qx "$KB_SCHEMA"; then
  current_bindings="$(gsettings get "$KB_SCHEMA" custom-keybindings 2>/dev/null || echo "@as []")"
  current_bindings="${current_bindings#@as }"

  if [[ "$current_bindings" == "[]" ]]; then
    new_bindings="['$KB_PATH']"
  elif [[ "$current_bindings" == *"'$KB_PATH'"* ]]; then
    new_bindings="$current_bindings"
  else
    trimmed="${current_bindings%]}"
    new_bindings="$trimmed, '$KB_PATH']"
  fi

  gsettings set "$KB_SCHEMA" custom-keybindings "$new_bindings" || log_warn "Failed to register custom keybinding list"
  gsettings set "$KB_SUBSCHEMA" name "Launch Kitty" || log_warn "Failed to set custom keybinding name"
  gsettings set "$KB_SUBSCHEMA" command "kitty" || log_warn "Failed to set custom keybinding command"
  gsettings set "$KB_SUBSCHEMA" binding "<Super>t" || log_warn "Failed to set custom keybinding binding"
  log_info "Mapped Super+T to launch kitty"
else
  log_warn "GNOME media-keys schema not found; skipping Super+T keybinding"
fi
