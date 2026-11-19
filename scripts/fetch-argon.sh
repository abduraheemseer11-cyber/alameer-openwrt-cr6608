#!/usr/bin/env bash
# Downloads ONLY luci-theme-argon and luci-app-argon-config (not in the official 23.05 feeds)
# into <imagebuilder>/packages. Each package comes from its own repo; the theme repo's release
# also ships a tiny "luci-app-argon-config" stub which we deliberately do not download.
set -euo pipefail
DEST="${1:?usage: fetch-argon.sh <imagebuilder>/packages}"
mkdir -p "$DEST"
gh release download --repo jerrykuku/luci-theme-argon      --pattern 'luci-theme-argon_*.ipk'      --dir "$DEST" --clobber
gh release download --repo jerrykuku/luci-app-argon-config --pattern 'luci-app-argon-config_*.ipk' --dir "$DEST" --clobber
ls -l "$DEST"/*argon*.ipk
