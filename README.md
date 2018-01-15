## storyline

A super simple vim syntax setup for a story outline format I use.

The point is to color the dots representing indented bullets to allow for better visualization when working with highly expanded outlines.

(Zero-tabbed bullets with colons are also special.  Check `examples` after running install.)

## slacknotes

A vim syntax for notes governing Slack conversations (or anything with dates, times, and indented checklists).  I use it personally for work.

Dates are highlighted, as well as `> 9:20pm` times.  Also, `-`, `x`, and `.` bullets, tabbed.

## Installation
Install by creating symlinks.
```bash
./install.sh -l
```
Install by copying.
```bash
./install.sh -c
```
Remove otherwise-installed files.  Uninstall.
```bash
./install.sh -r
```
`-d` specifies target vim directory, and `-f` specifies target vim file.
```bash
./install.sh -d ~/.vim -f storyline.vim
```

Install option defaults to `-l`.

#### Modules
Modules (I'm not sure what to call them, syntax file-layouts?), or directories with file structures to copy into `VIMDIR`, are now in use.  There are two ways to select a module.
- `-m` : targets a specific module directory
- `-f` : if there exists a module with a directory name matching the input `*.vim` file, sitting within the repo, that will be selected as the module
