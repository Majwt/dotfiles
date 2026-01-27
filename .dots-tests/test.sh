#!/usr/bin/env bash
set -e

echo "== Testing Arch =="
docker build -f Dockerfile.arch -t dotfiles-arch ..
docker run -it dotfiles-arch

# echo "== Testing Ubuntu =="
# docker build -f Dockerfile.ubuntu -t dotfiles-ubuntu ..
# docker run -it dotfiles-ubuntu

