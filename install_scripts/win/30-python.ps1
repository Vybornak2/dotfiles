winget install Python.Python.3.13 --accept-package-agreements --accept-source-agreements
winget install astral-sh.uv --accept-package-agreements --accept-source-agreements
$pythonDir = Split-Path (py -c "import sys; print(sys.executable)")
[Environment]::SetEnvironmentVariable("PATH", "$pythonDir;" + [Environment]::GetEnvironmentVariable("PATH", "User"), "User")
