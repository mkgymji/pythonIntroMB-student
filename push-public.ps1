# push-public.ps1 -- synchronizuje student/ do verejneho repozitare (Windows)
#
# Prvni pouziti:
#   git remote add public https://github.com/mkgymji/pythonIntroMB-student.git
#
# Pouziti:
#   .\push-public.ps1

$ErrorActionPreference = "Stop"

$remote = "public"
$prefix = "student"
$branch = "main"

$remotes = git remote
if ($remote -notin $remotes) {
    Write-Error "Chyba: remote '$remote' neexistuje. Spust: git remote add $remote https://github.com/mkgymji/pythonIntroMB-student.git"
    exit 1
}

Write-Host "Synchronizuji $prefix/ -> remote '$remote' (vetev $branch)..."
git subtree push --prefix="$prefix" $remote $branch
Write-Host "Hotovo."
