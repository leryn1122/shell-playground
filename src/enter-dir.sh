#!/usr/bin/env bash
#shellchek=bash

set -eu

# Enter the diretory safely.
# For example, enter the current directory.
cd -P "$(dirname "${0-${BASH_SOURCE[0]}}")" && pwd || exit 1