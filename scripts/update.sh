#!/usr/bin/env bash
set -euo pipefail

source upstream.conf
source build.conf

if [[ ! -d $UPSTREAM_PATH/.git ]]; then
	exit 0
fi

cd "$UPSTREAM_PATH"


mkdir -p ../../patches ../../patches.bak
rm -rf ../../patches.bak
mv ../../patches ../../patches.bak
mkdir -p ../../patches

git format-patch "$UPSTREAM_REF" -o ../../patches
