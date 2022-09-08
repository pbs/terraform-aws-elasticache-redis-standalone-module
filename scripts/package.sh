#!/usr/bin/env bash

# Unofficial bash strict mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

GIT_ROOT=$(git rev-parse --show-toplevel)

mkdir -p "$GIT_ROOT"/examples/lambda/artifacts

pushd "$GIT_ROOT"/examples/lambda/src >/dev/null
pipenv install
SITE_PACKAGES="$(fd -td -u site-packages "$(pipenv --venv)")"

pushd "$SITE_PACKAGES" >/dev/null
zip -r9 "$GIT_ROOT"/examples/lambda/artifacts/handler.zip ./*

popd >/dev/null
zip -g "$GIT_ROOT"/examples/lambda/artifacts/handler.zip ./*
