$ErrorActionPreference = "Stop"

$repoRoot = git rev-parse --show-toplevel 2>$null
if (-not $repoRoot) {
    throw "Run this script from inside a Git repository."
}

$hookPath = Join-Path $repoRoot ".git\hooks\pre-commit"
$sentinelPath = Join-Path (Split-Path -Parent $PSCommandPath) "sentinel.py"

@
'# Git Secrets Sentinel pre-commit hook
python "' + $sentinelPath + '"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
'@ | Set-Content -Path $hookPath -Encoding UTF8

Write-Host "Git Secrets Sentinel pre-commit hook installed: $hookPath"
