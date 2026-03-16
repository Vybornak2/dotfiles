#!/usr/bin/env bash

log_info "Bootstrapping Neovim plugins and Mason tools (headless)"
if command -v nvim >/dev/null 2>&1; then
  nvim --headless "+Lazy! sync" +qa || log_warn "Lazy sync failed; run inside Neovim later."
  nvim --headless "+MasonInstall stylua pyright clangd rust-analyzer" +qa || log_warn "Mason install failed; run :MasonInstall stylua pyright clangd rust-analyzer manually."
else
  log_warn "nvim not found; skipping Neovim bootstrap"
fi
