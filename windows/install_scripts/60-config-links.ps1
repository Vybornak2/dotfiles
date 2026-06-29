$dotfiles = Join-Path $env:USERPROFILE 'dotfiles'

# nvim - directory junction (now stored under linux/stow_packages)
$nvimLink = Join-Path $env:LOCALAPPDATA 'nvim'#$nvimTarget = Join-Path -Path $dotfiles -ChildPath 'nvim'  # old location
$nvimTarget = "$dotfiles\linux\stow_packages\nvim\.config\nvim"
if (Test-Path $nvimLink) {
    $item = Get-Item -LiteralPath $nvimLink -Force
    if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { cmd /c rmdir "$nvimLink" } else { Remove-Item -Recurse -Force $nvimLink }
}
cmd /c mklink /J "$nvimLink" "$nvimTarget"

# VS Code settings - symlink (from stow package)
$vscodeDir = Join-Path $env:APPDATA 'Code\User'
$vscodeSettings = Join-Path $vscodeDir 'settings.json'#$vscodeTarget = "$dotfiles\vscode\settings.json"  # old location
$vscodeTarget = "$dotfiles\linux\stow_packages\vscode\.config\Code\User\settings.json"
if (-not (Test-Path $vscodeDir)) { New-Item -ItemType Directory -Force -Path $vscodeDir | Out-Null }
if (Test-Path $vscodeSettings) { Remove-Item $vscodeSettings -Force }
cmd /c mklink "$vscodeSettings" "$vscodeTarget"

# Get the true Documents folder (bypasses OneDrive issues)
$trueDocuments = [Environment]::GetFolderPath('MyDocuments')

# Windows PowerShell 5.1 profile (posh moved under windows/posh)
$ps5Dir = Join-Path $trueDocuments 'WindowsPowerShell'
$ps5Profile = Join-Path $ps5Dir 'Microsoft.PowerShell_profile.ps1'
if (-not (Test-Path $ps5Dir)) { New-Item -ItemType Directory -Force -Path $ps5Dir | Out-Null }
if (Test-Path $ps5Profile) { Remove-Item $ps5Profile -Force }
cmd /c mklink "$ps5Profile" "$dotfiles\windows\posh\profile.ps1"

# PowerShell 7 profile 
$ps7Dir = Join-Path $trueDocuments 'PowerShell'
$ps7Profile = Join-Path $ps7Dir 'Microsoft.PowerShell_profile.ps1'
if (-not (Test-Path $ps7Dir)) { New-Item -ItemType Directory -Force -Path $ps7Dir | Out-Null }
if (Test-Path $ps7Profile) { Remove-Item $ps7Profile -Force }
cmd /c mklink "$ps7Profile" "$dotfiles\windows\posh\profile.ps1"

# Windows Terminal settings - try Store and non-Store locations
$wtTargets = @(
    "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json",
    "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json"
)
$wtSource = Join-Path $dotfiles 'windows\windows-terminal\settings.json'
foreach ($wt in $wtTargets) {
    $wtDir = Split-Path $wt -Parent
    if (-not (Test-Path $wtDir)) { New-Item -ItemType Directory -Force -Path $wtDir | Out-Null }
    if (Test-Path $wt) { Remove-Item $wt -Force }
    cmd /c mklink "$wt" "$wtSource"
}
