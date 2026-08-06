#!/usr/bin/env bash
set -euo pipefail

script_path="$(dirname "$(realpath "$0")")"

source build.conf

CARGO_TARGET="$script_path/../target" 

scripts/bootstrap.sh

cd "$UPSTREAM_PATH"

mkdir -p "$CARGO_TARGET"
CARGO_TARGET_DIR="$CARGO_TARGET" cargo build --release
