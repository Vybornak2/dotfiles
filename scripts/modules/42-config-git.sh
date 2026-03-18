#!/usr/bin/env bash

log_info "Configuring git"
git config --global user.name "Vybornak2"
git config --global user.email "jan.vyborny2@gmail.com"
git config --global init.defaultBranch "main"

log_info "Git config applied:"
git config --global -l | grep -E "^(user\.|init\.)" || true
