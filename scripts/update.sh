#!/usr/bin/env bash
set -euo pipefail
working_path="$(pwd)"
patches_path="$working_path/patches"

source upstream.conf
source build.conf

if (( "$#" <= 0 )); then
	echo "	you must specify the commit text or the --amend argument to edit the previous commit or --no-commit

usage:
	$0 [text/--amend/--no-commit]"
	exit 0
fi

if [[ ! -d $UPSTREAM_PATH/.git ]]; then
	exit 0
fi



mkdir -p "$patches_path"

rm "$patches_path"/*.patch

cd "$UPSTREAM_PATH"
git format-patch --zero-commit "$UPSTREAM_REF" -o "$patches_path"

if [[ "$1" == "--no-commit" ]]; then
	exit 0
fi

args=()
if [[ "$1" == "--amend" ]]; then
	args+=("--amend")
else
	args+=(-m "$*")
fi

cd "$working_path"
git restore --staged .
git add "$patches_path"
git commit "${args[@]}"
