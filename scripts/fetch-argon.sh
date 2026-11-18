#!/usr/bin/env bash
# Downloads luci-theme-argon (not in the official 23.05 feeds) into <imagebuilder>/packages.
# NOTE: Argon 3.x already bundles the config app (argon-config.js, menu.d, acl.d), so the
# separate luci-app-argon-config package must NOT be installed - it clashes with the theme.
set -euo pipefail
DEST="${1:?usage: fetch-argon.sh <imagebuilder>/packages}"
mkdir -p "$DEST"
gh release download --repo jerrykuku/luci-theme-argon --pattern 'luci-theme-argon_*.ipk' --dir "$DEST" --clobber
ls -l "$DEST"/*argon*.ipk
