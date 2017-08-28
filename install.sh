#!/bin/bash

# Arguments:
#   -r  remove syntax files
#   -l  create syntax file symlinks
#   -c  copy syntax files
#   -d  set vim dir (~/.vim, by default)
#   -f  set target syntax file

VIMDIR=~/.vim
FNAME=storyline.vim
METHOD='ln'
while [ $# -gt 0 ]; do
	[ "$1" = '-l' ] && METHOD='ln'
	[ "$1" = '-r' ] && METHOD='rm'
	[ "$1" = '-c' ] && METHOD='cp'
	if [ "$1" = '-d' ]; then
		VIMDIR="$2"
		shift
	elif [ "$1" = '-f' ]; then
		FNAME="$2"
		shift
	fi
	shift
done

# Flag usage intended for multiple asserts.
FLAG=false
if [ ! -d "$VIMDIR" ]; then
	echo "VIMDIR ($VIMDIR) invalid" && FLAG=true
fi
$FLAG && exit 1

# Ensure the directories are there.
mkdir -p "$VIMDIR/ftdetect"
mkdir -p "$VIMDIR/syntax"

case $METHOD in
	ln)
		# Create symlinks.
		ln -s "$PWD/ftdetect/$FNAME" "$VIMDIR/ftdetect/"
		ln -s "$PWD/syntax/$FNAME"   "$VIMDIR/syntax/"
		;;
	cp)
		# Copy files over.
		cp "$PWD/ftdetect/$FNAME" "$VIMDIR/ftdetect/"
		cp "$PWD/syntax/$FNAME" "$VIMDIR/syntax/"
		;;
	rm)
		# Remove files.
		[ -f "$VIMDIR/ftdetect/$FNAME" ] && \
			rm "$VIMDIR/ftdetect/$FNAME"
		[ -f "$VIMDIR/syntax/$FNAME" ] && \
			rm "$VIMDIR/syntax/$FNAME"
		;;
esac

