#!/usr/bin/env bash
set -euo pipefail
ROOT="${CI_PROJECT_DIR:-$(git rev-parse --show-toplevel)}"
cd "$ROOT"
"$ROOT/infra/scripts/ci/validate-repo.sh" --root "$ROOT"
"$ROOT/infra/scripts/ci/check-size.sh" --root "$ROOT"
"$ROOT/infra/scripts/ci/validate-local-issues.sh" --root "$ROOT"
for f in infra/scripts/*.sh; do bash -n "$f"; done
if command -v mix >/dev/null 2>&1; then
  mix format --check-formatted
  mix test
elif [[ "${CI:-}" == "true" || "${GITHUB_ACTIONS:-}" == "true" ]]; then
  echo "elixir and mix are required in CI" >&2
  exit 1
else
  echo "elixir and mix not installed; structural checks only"
fi
