#!/usr/bin/env bash

if command -v omarchy-version >/dev/null 2>&1; then
  version="Omarchy $(omarchy-version)"
else
  source /etc/os-release
  version="$PRETTY_NAME"
fi
echo "$version"
