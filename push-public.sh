#!/usr/bin/env bash
# push-public.sh -- synchronizuje student/ do verejneho repozitare
#
# Prvni pouziti:
#   git remote add public https://github.com/mkgymji/pythonIntroMB-student.git
#   (remote je uz nastaven, viz git remote -v)
#
# Pouziti:
#   ./push-public.sh

set -euo pipefail

REMOTE="public"
PREFIX="student"
BRANCH="main"

if ! git remote | grep -q "^${REMOTE}$"; then
    echo "Chyba: remote '${REMOTE}' neexistuje." >&2
    echo "Spust: git remote add ${REMOTE} https://github.com/mkgymji/pythonIntroMB-student.git" >&2
    exit 1
fi

echo "Synchronizuji ${PREFIX}/ -> remote '${REMOTE}' (vetev ${BRANCH})..."
git subtree push --prefix="${PREFIX}" "${REMOTE}" "${BRANCH}"
echo "Hotovo."
