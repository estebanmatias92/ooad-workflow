#!/usr/bin/env bash
# Sync shared templates/ + references/ into every skill folder.
#
# Why: `npx skills add` installs each skill folder standalone, so the
# repo-relative `templates/*` / `references/*` links inside SKILL.md bodies
# would dangle on single-skill installs. Bundling copies under each skill
# keeps the existing path strings resolving unchanged.
#
# Source of truth: ./templates/ and ./references/ at the repo root.
# Generated copies: ./skills/<name>/templates/ and ./skills/<name>/references/
# are committed (they are the distribution payload).
#
# Re-run after editing any template or reference, before committing:
#   ./scripts/sync-skill-bundles.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for skill in "$ROOT"/skills/*/; do
  rm -rf "${skill}templates" "${skill}references"
  cp -r "$ROOT/templates" "${skill}templates"
  cp -r "$ROOT/references" "${skill}references"
  echo "synced: $(basename "$skill")"
done
