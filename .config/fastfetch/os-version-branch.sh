#!/usr/bin/env bash

if command -v omarchy-version-branch >/dev/null 2>&1; then
  output="$(omarchy-version-branch)"
else
  source /etc/os-release
  output="$VERSION_CODENAME"
fi
echo "$output"
