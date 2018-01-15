#!/bin/bash

# Arguments:
#   -r  remove syntax files
#   -l  create syntax file symlinks
#   -c  copy syntax files
#   -d  set vim dir (~/.vim, by default)
#   -f  set target syntax file

VIMDIR=~/.vim
FNAME=storyline.vim
FDIR="$PWD"
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
	elif [ "$1" = '-m' ]; then
		FDIR="$2"
		shift
	fi
	shift
done

function test_module_dir() {
	DIR=`echo "$1" | sed 's#/$##'`
	[ -d "$DIR/ftdetect" ] || return 1
	[ -d "$DIR/syntax" ]   || return 1
	echo "$DIR"
	return 0
}

# If the fname has a matching directory, set FDIR to that.
if RES=`test_module_dir "$(echo $FNAME | sed 's/\.vim$//')"`; then
	FDIR="$PWD/$RES"
fi

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
		ln -sf "$FDIR/ftdetect/$FNAME" "$VIMDIR/ftdetect/"
		ln -sf "$FDIR/syntax/$FNAME"   "$VIMDIR/syntax/"
		;;
	cp)
		# Copy files over.
		cp -f "$FDIR/ftdetect/$FNAME" "$VIMDIR/ftdetect/"
		cp -f "$FDIR/syntax/$FNAME" "$VIMDIR/syntax/"
		;;
	rm)
		# Remove files.
		[ -e "$VIMDIR/ftdetect/$FNAME" -o -L "$VIMDIR/ftdetect/$FNAME" ] && \
			rm "$VIMDIR/ftdetect/$FNAME"
		[ -e "$VIMDIR/syntax/$FNAME" -o -L "$VIMDIR/syntax/$FNAME" ] && \
			rm "$VIMDIR/syntax/$FNAME"
		;;
esac

