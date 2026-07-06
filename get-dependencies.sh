#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
# pacman -Syu --noconfirm PACKAGESHERE

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here

echo "Getting binary..."
echo "---------------------------------------------------------------"
link=https://github.com/clonehero-game/releases/releases/latest/download/Linux.$ARCH-Standalone.tar
wget --retry-connrefused --tries=30 "$link" -O /tmp/temp.tar
tar -xvf /tmp/temp.tar
rm -f /tmp/temp.tar

mkdir -p ./AppDir/bin
mv -v ./'Linux - Standalone'/* ./AppDir/bin
chmod +x ./AppDir/bin/clonehero
cp -v ./AppDir/bin/clonehero_Data/Resources/UnityPlayer.png ./AppDir/.DirIcon
cp -v ./AppDir/bin/clonehero_Data/Resources/UnityPlayer.png ./AppDir/clonehero.png
