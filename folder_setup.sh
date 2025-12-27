#!/usr/bin/env bash

set -e

BASE="$HOME/.workspace"

echo "Creating base workspace at $BASE"

mkdir -p \
"$BASE/dev/godot" \
"$BASE/dev/dotnet" \
"$BASE/dev/python" \
"$BASE/dev/utils" \
"$BASE/dev/desktop" \
"$BASE/dev/assets" \
\
"$BASE/docs/resumes" \
"$BASE/docs/cover-letters" \
"$BASE/docs/templates" \
\
"$BASE/media/images" \
"$BASE/media/audio" \
"$BASE/media/videos" \
"$BASE/media/fonts" \
\
"$BASE/personal/finance" \
"$BASE/personal/travel" \
"$BASE/personal/health" \
"$BASE/personal/misc" \
\
"$BASE/tmp"

echo "Folder creation completed successfully..."
echo "Creating Symlinks.."


link() {
	local target="$1"
	local linkname="$2"
	if [ -L "$linkname" ]; then
		echo "Symlink exists: $linkname"
	elif [ -e "$linkname" ]; then
		echo "Skipping $linkname (already exists and is not a symlink"
	else
		ln -s "$target" "$linkname"
		echo "Created symlink: $linkname -> $target"
	fi
}

link "$BASE/dev"	"$HOME/Development"
link "$BASE/dev/godot"	"$HOME/Godot Projects"
link "$BASE/docs"	"$HOME/Documentation"
link "$BASE/media"	"$HOME/Media"
link "$BASE/personal"	"$HOME/Personal"
link "$BASE/tmp"	"$HOME/Temp"

echo "Symlink Completed"
