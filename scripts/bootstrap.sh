#!/usr/bin/env bash
set -euo pipefail

script_path="$(dirname "$(realpath "$0")")"

source build.conf
source upstream.conf

mkdir -p $UPSTREAM_PATH

if [[ ! -d $UPSTREAM_PATH/.git ]]; then
    git clone "$UPSTREAM_URL" $UPSTREAM_PATH
fi

cd $UPSTREAM_PATH

if git rev-parse --git-path rebase-apply >/dev/null 2>&1 &&
   [[ -d "$(git rev-parse --git-path rebase-apply)" ]]; then
	git am --quit
fi

git fetch origin
git reset --hard
git clean -fdx

if git show-ref --verify --quiet refs/heads/work; then
	if [[ "$(git branch --show-current)" == "work" ]]; then
        git switch --detach "$UPSTREAM_REF_COMMIT"
    fi
	git branch -D work
fi
git switch -c work "$UPSTREAM_REF_COMMIT"


git am "$script_path/../patches/"*.patch
