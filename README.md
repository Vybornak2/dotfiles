# dotfiles

Personal development environment bootstrap for Ubuntu/Pop!_OS.

This repository provides:

- Zsh setup (Oh My Zsh, Powerlevel10k, plugins)
- Neovim setup (Kickstart-based config, plugin bootstrap, Mason tools)
- Visual Studio Code setup (settings link + extension install)
- Kitty terminal setup (config link, default terminal, Super+T shortcut)
- Core CLI/language tooling (Rust, uv, Python tools, C/C++ toolchain, utftex)
- Font setup (JetBrains Mono + Nerd Font)

## Repository layout

- `.zshrc`: shell config
- `.p10k.zsh`: Powerlevel10k config
- `nvim/`: versioned Neovim Kickstart config
- `kitty/`: Kitty terminal config
- `settings.json`: VS Code user settings to be linked
- `scripts/install.sh`: main installer entrypoint
- `scripts/*.sh`: modular install stages
- `docs/TOOLING_REFERENCE.md`: tools/packages reference
- `docs/PLUGIN_WIKI.md`: plugin/extension wiki links

## Supported systems

- Ubuntu
- Pop!_OS

## Quick start

```bash
git clone https://github.com/Vybornak2/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x scripts/*.sh scripts/testing/*.sh
./scripts/install.sh
./scripts/42-config-git.sh
```

Notes:

- Run from the repository root.
- Installer uses `sudo` for system packages.
- Each numbered script can also be run directly from `scripts/`.
- Docker users need to log out and back in after install so the group change takes effect.

## Installer controls

Run specific portions of the installer:

```bash
./scripts/install.sh
./scripts/42-config-git.sh
```

Execution order is defined in `scripts/install.sh`:

- `10-setup-preflight.sh`
- `20-deps-core-packages.sh`
- `21-deps-cpp.sh`
- `22-deps-python.sh`
- `23-deps-rust.sh`
- `24-deps-lua.sh`
- `25-deps-fonts.sh`
- `30-tools-node.sh`
- `31-tools-kitty.sh`
- `32-tools-zsh.sh`
- `33-tools-nvim.sh`
- `34-tools-extra-cli.sh`
- `35-tools-docker.sh`
- `36-tools-vscode.sh`
- `37-tools-utftex.sh`
- `40-config-links.sh`
- `41-config-nvim-bootstrap.sh`
- `42-config-git.sh`
- `43-config-terminal.sh`
- `50-verify.sh`
- `51-cleanup.sh`

## Documentation

- Tool/package reference: `docs/TOOLING_REFERENCE.md`
- Plugin/extension wiki links: `docs/PLUGIN_WIKI.md`
- Requirements checklist: `todo.md`

## After install

- Restart shell session to load updated Zsh environment.
- Open Neovim once and confirm plugins/LSP tools are healthy via `:checkhealth`.
- Open VS Code and confirm extensions/settings are applied.
