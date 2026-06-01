$dotfiles = "$env:USERPROFILE\dotfiles"

# nvim - directory junction
$nvimLink = "$env:LOCALAPPDATA\nvim"
if (Test-Path $nvimLink) { cmd /c rmdir "$nvimLink" }
cmd /c mklink /J "$nvimLink" "$dotfiles\nvim"

# VS Code settings - symlink
$vscodeDir = "$env:APPDATA\Code\User"
$vscodeSettings = "$vscodeDir\settings.json"
if (-not (Test-Path $vscodeDir)) { New-Item -ItemType Directory -Force -Path $vscodeDir | Out-Null }
if (Test-Path $vscodeSettings) { Remove-Item $vscodeSettings -Force }
cmd /c mklink "$vscodeSettings" "$dotfiles\vscode\settings.json"

# Get the true Documents folder (bypasses OneDrive issues)
$trueDocuments = [Environment]::GetFolderPath('MyDocuments')

# Windows PowerShell 5.1 profile
$ps5Dir = "$trueDocuments\WindowsPowerShell"
$ps5Profile = "$ps5Dir\Microsoft.PowerShell_profile.ps1"
if (-not (Test-Path $ps5Dir)) { New-Item -ItemType Directory -Force -Path $ps5Dir | Out-Null }
if (Test-Path $ps5Profile) { Remove-Item $ps5Profile -Force }
cmd /c mklink "$ps5Profile" "$dotfiles\posh\profile.ps1"

# PowerShell 7 profile 
$ps7Dir = "$trueDocuments\PowerShell"
$ps7Profile = "$ps7Dir\Microsoft.PowerShell_profile.ps1"
if (-not (Test-Path $ps7Dir)) { New-Item -ItemType Directory -Force -Path $ps7Dir | Out-Null }
if (Test-Path $ps7Profile) { Remove-Item $ps7Profile -Force }
cmd /c mklink "$ps7Profile" "$dotfiles\posh\profile.ps1"
