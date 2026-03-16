#!/usr/bin/env bash

if ! command -v code >/dev/null 2>&1; then
  log_info "Installing Visual Studio Code"
  sudo install -d -m 0755 /etc/apt/keyrings

  if [[ ! -f /etc/apt/keyrings/packages.microsoft.gpg ]]; then
    curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg >/dev/null
    sudo chmod go+r /etc/apt/keyrings/packages.microsoft.gpg
  fi

  if [[ ! -f /etc/apt/sources.list.d/vscode.list ]]; then
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
  fi

  sudo apt-get update
  apt_install code
else
  log_info "Visual Studio Code already installed"
fi

if command -v code >/dev/null 2>&1; then
  log_info "Installing VS Code extensions"
  code --install-extension ms-python.python --force || true
  code --install-extension ms-python.vscode-pylance --force || true
  code --install-extension charliermarsh.ruff --force || true
  code --install-extension rust-lang.rust-analyzer --force || true
  code --install-extension ms-vscode.cpptools --force || true
  code --install-extension llvm-vs-code-extensions.vscode-clangd --force || true
  code --install-extension ms-toolsai.jupyter --force || true
  code --install-extension vscodevim.vim --force || true
  code --install-extension GitHub.copilot-chat --force || true
  code --install-extension GitHub.vscode-pull-request-github --force || true
  code --install-extension pkief.material-icon-theme --force || true
  code --install-extension njpwerner.autodocstring --force || true
  code --install-extension aaron-bond.better-comments --force || true
else
  log_warn "VS Code binary not found; skipping extension install"
fi
