# dotfiles

Personal development environment bootstrap for Ubuntu/Pop!_OS.

This repository provides:

- Zsh setup (Oh My Zsh, Powerlevel10k, plugins)
- Neovim setup (Kickstart-based config, plugin bootstrap, Mason tools)
- Visual Studio Code setup (settings link + extension install)
- Core CLI/language tooling (Rust, uv, Python tools, C/C++ toolchain)
- Font setup (JetBrains Mono + Nerd Font)

## Repository layout

- `.zshrc`: shell config
- `nvim/`: Neovim config
- `settings.json`: VS Code user settings to be linked
- `scripts/install.sh`: main installer entrypoint
- `scripts/modules/`: modular install stages
- `docs/TOOLING_REFERENCE.md`: tools/packages reference
- `docs/PLUGIN_WIKI.md`: plugin/extension wiki links

## Supported systems

- Ubuntu
- Pop!_OS

## Quick start

```bash
git clone https://github.com/Vybornak2/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x scripts/install.sh
./scripts/install.sh --skip 51-cleanup.sh
```

Notes:

- Run from the repository root.
- Installer uses `sudo` for system packages.
- Skipping cleanup keeps temporary build artifacts for debugging.

## Installer controls

Run specific portions of the installer:

```bash
./scripts/install.sh --from 30-tools-zsh.sh
./scripts/install.sh --only 33-tools-vscode.sh
./scripts/install.sh --skip 51-cleanup.sh
```

Execution order is defined in `scripts/install.sh`:

1. `10-setup-preflight.sh`
2. `11-setup-system-update.sh`
3. `20-deps-core-packages.sh`
4. `21-deps-cpp.sh`
5. `22-deps-python.sh`
6. `23-deps-rust.sh`
7. `24-deps-lua.sh`
8. `25-deps-fonts.sh`
9. `26-deps-node.sh`
10. `30-tools-zsh.sh`
11. `31-tools-nvim.sh`
12. `32-tools-extra-cli.sh`
13. `33-tools-vscode.sh`
14. `40-config-links.sh`
15. `41-config-nvim-bootstrap.sh`
16. `42-config-git.sh`
17. `50-verify.sh`
18. `51-cleanup.sh`

## Documentation

- Tool/package reference: `docs/TOOLING_REFERENCE.md`
- Plugin/extension wiki links: `docs/PLUGIN_WIKI.md`
- Requirements checklist: `todo.md`

## After install

- Restart shell session to load updated Zsh environment.
- Open Neovim once and confirm plugins/LSP tools are healthy via `:checkhealth`.
- Open VS Code and confirm extensions/settings are applied.
