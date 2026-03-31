# Sync design-quality-suite slash commands from the canonical set to a target project.
# Canonical: .claude/commands/ (repo root)
# Usage:     powershell -File "scripts/sync-design-quality-commands.ps1" [-TargetRoot "<path>"]
#
# If -TargetRoot is omitted, the script syncs into the repo root itself.
# To mirror into another project, pass the path to that project's root:
#   powershell -File "scripts/sync-design-quality-commands.ps1" -TargetRoot "C:\MyProject"

param(
    [string]$TargetRoot = ""
)

$ErrorActionPreference = "Stop"
$here = $PSScriptRoot
$canonical = Join-Path (Split-Path $here -Parent) ".claude\commands"
$repoRoot = (Resolve-Path (Join-Path $here "..")).Path

if ($TargetRoot -eq "") {
    $TargetRoot = $repoRoot
}

$files = @(
    "design-quality-core.md",
    "craft.md",
    "refine.md",
    "output-contract.md"
)

foreach ($name in $files) {
    $src = Join-Path $canonical $name
    if (-not (Test-Path $src)) { throw "Missing canonical file: $src" }
}

$targetDir = Join-Path $TargetRoot ".claude\commands"

if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

foreach ($name in $files) {
    Copy-Item (Join-Path $canonical $name) (Join-Path $targetDir $name) -Force
}

Write-Host "Synced -> $targetDir"
Write-Host "Done. Canonical remains: $canonical"
