#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR_REAL="$(realpath "$CARGO_TARGET")"

source build.conf

scripts/bootstrap.sh

cd "$UPSTREAM_PATH"

mkdir -p "$TARGET_DIR_REAL"
CARGO_TARGET_DIR="$TARGET_DIR_REAL" cargo build --release
