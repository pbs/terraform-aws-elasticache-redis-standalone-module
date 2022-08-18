#!/usr/bin/env bash

# Unofficial bash strict mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

GIT_ROOT=$(git rev-parse --show-toplevel)

"$GIT_ROOT"/scripts/package.sh

pushd "$GIT_ROOT"/tests >/dev/null
go test -timeout 45m -count=1 -parallel 10 ./...
