#!/usr/bin/env bash
#shellchek=bash

set -eu

# Print stack trace, implemented by built-in `caller`.
stack_trace() {
  printf 'error: %s\n' "$1" >&2
  local i=0
  while true; do
    s=$(caller $i)
    if [ -z "$s" ]; then
      break
    fi
    # shellcheck disable=SC2068
    printf '  at %s:%s (File: %s)\n' ${s[@]};
    ((i++))
  done
}

# Print stack trace, and throw error.
throw() {
  stack_trace "$1" >&2
  exit 1
}