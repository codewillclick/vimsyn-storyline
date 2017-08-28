# vimsyn-storyline
Super simple vim syntax setup for a story outline format I use.

The point is to color the dots representing indented bullets to allow for better visualization when working with highly expanded outlines.

(Zero-tabbed bullets with colons are also special.  Check `examples` after running install.)

That's really all this does.

## Installation
```bash
# Install by creating symlinks.
./install.sh -l
```
```bash
# Install by copying.
./install.sh -c
```
```bash
# Remove otherwise-installed files.  Uninstall.
./install.sh -r
```
```bash
# -d specifies target vim directory, and -f specifies target vim file.
./install.sh -d ~/.vim -f storyline.vim
```

Install option defaults to `-l`.

