$profileDir = Split-Path $PROFILE
New-Item -ItemType Directory -Force -Path $profileDir | Out-Null
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$env:USERPROFILE\dotfiles\powershell\profile.ps1" -Force
