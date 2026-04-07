# Tooling Reference

This document tracks the tools, package managers, and extension/plugin dependencies used by this dotfiles setup.

## Installer entrypoints

- Main installer: `scripts/install.sh`
- Shared helpers: `scripts/lib/common.sh`
- Modules: `scripts/*.sh`

## Package and environment managers

- APT (Ubuntu/Pop!_OS): <https://wiki.debian.org/Apt>
- Oh My Zsh framework: <https://ohmyz.sh/>
- Rustup (Rust toolchain manager): <https://rustup.rs/>
- uv (Python package/tool manager): <https://docs.astral.sh/uv/>
- nvm (Node.js version manager): <https://github.com/nvm-sh/nvm>
- Kitty installer: <https://sw.kovidgoyal.net/kitty/installer.sh>
- Mason (Neovim external tools manager): <https://github.com/mason-org/mason.nvim>
- lazy.nvim (Neovim plugin manager): <https://github.com/folke/lazy.nvim>

## Core CLI tools installed by installer

Source: `scripts/20-deps-core-packages.sh`, `scripts/30-tools-node.sh`, `scripts/31-tools-kitty.sh`, `scripts/34-tools-extra-cli.sh`, `scripts/35-tools-docker.sh`

- Git: <https://git-scm.com/doc>
- ripgrep (`rg`): <https://github.com/BurntSushi/ripgrep>
- fd (`fd-find` package on Debian/Ubuntu): <https://github.com/sharkdp/fd>
- fzf: <https://github.com/junegunn/fzf>
- jq: <https://jqlang.github.io/jq/>
- tree: <http://mama.indstate.edu/users/ice/tree/>
- bat: <https://github.com/sharkdp/bat>
- shellcheck: <https://www.shellcheck.net/>
- Node.js (installed via nvm): <https://nodejs.org/en/docs>
- npm (bundled with nvm-managed Node.js): <https://docs.npmjs.com/>
- Docker CLI/Engine (Docker official Ubuntu repo): <https://docs.docker.com/engine/>
- Docker Compose plugin: <https://docs.docker.com/compose/>
- wl-clipboard: <https://github.com/bugaevc/wl-clipboard>
- xclip: <https://github.com/astrand/xclip>

## Python tools installed via uv

Source: `scripts/34-tools-extra-cli.sh`

- ruff: <https://docs.astral.sh/ruff/>
- black: <https://black.readthedocs.io/>
- isort: <https://pycqa.github.io/isort/>
- mypy: <https://mypy.readthedocs.io/>
- pyright: <https://github.com/microsoft/pyright>
- flake8: <https://flake8.pycqa.org/>
- pytest: <https://docs.pytest.org/>
- ipython: <https://ipython.readthedocs.io/>

## Language toolchains and build dependencies

Source: `scripts/21-deps-cpp.sh`, `scripts/33-tools-nvim.sh`

- Neovim release downloads: <https://github.com/neovim/neovim/releases/latest>
- Neovim 0.12.0+ required by installer
- GCC: <https://gcc.gnu.org/onlinedocs/>
- Clang/LLVM: <https://clang.llvm.org/docs/>
- CMake: <https://cmake.org/documentation/>
- Ninja: <https://ninja-build.org/manual.html>
- pkg-config: <https://www.freedesktop.org/wiki/Software/pkg-config/>
- Python venv: <https://docs.python.org/3/library/venv.html>
- pynvim: <https://github.com/neovim/pynvim>

## Shell stack

Source: `.zshrc`, `scripts/32-tools-zsh.sh`

- Zsh docs: <https://zsh.sourceforge.io/Doc/>
- Oh My Zsh docs/wiki: <https://github.com/ohmyzsh/ohmyzsh/wiki>
- Powerlevel10k docs: <https://github.com/romkatv/powerlevel10k>
- zsh-autosuggestions: <https://github.com/zsh-users/zsh-autosuggestions>
- zsh-syntax-highlighting: <https://github.com/zsh-users/zsh-syntax-highlighting>
- zoxide: <https://github.com/ajeetdsouza/zoxide>
- Zsh completion search paths: `/usr/local/share/zsh/site-functions`, `/usr/share/zsh/vendor-completions`

## Editor and IDE

### Neovim

- Neovim docs: <https://neovim.io/doc/>
- Neovim Lua guide: <https://neovim.io/doc/user/lua-guide.html>
- Kickstart.nvim reference: <https://github.com/nvim-lua/kickstart.nvim>

### Visual Studio Code

Source: `scripts/36-tools-vscode.sh`

- VS Code docs: <https://code.visualstudio.com/docs>
- Microsoft repo setup: <https://code.visualstudio.com/docs/setup/linux>
- Extension API/docs: <https://code.visualstudio.com/api>

## Fonts

Source: `scripts/25-deps-fonts.sh`

- JetBrains Mono: <https://www.jetbrains.com/lp/mono/>
- Nerd Fonts: <https://www.nerdfonts.com/>
- JetBrainsMono Nerd Font release artifact: <https://github.com/ryanoasis/nerd-fonts/releases>

## Related repository docs

- Plugin-specific references: `docs/PLUGIN_WIKI.md`
