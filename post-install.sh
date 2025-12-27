#!/usr/bin/env bash
set -euo pipefail

# Choose one:       # builds from source
ZEN_PKG="zen-browser-bin"  # faster install, prebuilt

PACMAN_PKGS=(
  base-devel
  git
  foot
  hyprpaper
  code
  ttf-jetbrains-mono-nerd
  godot-mono
  wf-recorder
)

AUR_PKGS=(
  aseprite
  hyprpanel-bin
  "${ZEN_PKG}"
)

echo "Syncing and updating system..."
sudo pacman -Syu --noconfirm

echo "Installing pacman packages..."
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

install_paru() {
  if command -v paru >/dev/null 2>&1; then
    echo "paru already installed."
    return 0
  fi

  echo "Installing paru..."
  local tmpdir
  tmpdir="$(mktemp -d)"
  trap 'rm -rf "$tmpdir"' EXIT

  git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
  (cd "$tmpdir/paru" && makepkg -si --noconfirm)
}

if ((${#AUR_PKGS[@]})); then
  install_paru
  echo "Installing AUR packages..."
  paru -S --needed --noconfirm "${AUR_PKGS[@]}"
fi

echo "Done."
