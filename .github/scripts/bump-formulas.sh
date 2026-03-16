#!/bin/bash
set -euo pipefail

# For each formula, check if a newer GitHub release exists and update the formula.
# Expects GH_TOKEN to be set for gh api calls.

for formula in Formula/*.rb; do
  name=$(basename "$formula" .rb)
  current=$(grep 'version "' "$formula" | head -1 | sed 's/.*version "\(.*\)"/\1/')
  repo=$(grep 'homepage "' "$formula" | sed 's|.*homepage "https://github.com/\(.*\)"|\1|')

  [[ -z "$repo" ]] && continue

  latest_tag=$(gh api "repos/${repo}/releases/latest" --jq '.tag_name' 2>/dev/null || true)
  latest=${latest_tag#v}

  [[ -z "$latest" || "$latest" == "$current" ]] && echo "${name}: ${current} (up to date)" && continue

  url=$(gh api "repos/${repo}/releases/latest" --jq '[.assets[] | select(.name | endswith(".tar.gz"))][0].browser_download_url' 2>/dev/null)
  [[ -z "$url" ]] && echo "${name}: no .tar.gz asset, skipping" && continue

  sha=$(curl -sL "$url" | shasum -a 256 | cut -d ' ' -f 1)

  sed -i "s|url \".*\"|url \"${url}\"|"         "$formula"
  sed -i "s|sha256 \".*\"|sha256 \"${sha}\"|"   "$formula"
  sed -i "s|version \".*\"|version \"${latest}\"|" "$formula"

  echo "${name}: ${current} → ${latest}"
done
