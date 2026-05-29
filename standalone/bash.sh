#!/usr/bin/env bash
set -euo pipefail

declare -A labels=([todo]="Queued" [doing]="In progress" [done]="Complete")

for status in "${!labels[@]}"; do
  if [[ ${status} == "${1:-doing}" ]]; then
    printf '%s=%q\n' "$status" "${labels[$status]}"
  fi
done
