#!/bin/bash

set -e

PKGS=(
  # Apps
  firefox
  thunderbird
  calibre
  brave-bin

  # Fonts
  nerd-fonts-git
  noto-fonts
  ttf-fira-code
  ttf-material-design-icons-webfont
  ttf-roboto
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
