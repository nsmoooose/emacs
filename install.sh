#!/bin/bash
echo "Copying emacs scripts to the home folder: ~/.emacs.d"
[ -d ~/.emacs.d ] && rm -fr ~/.emacs.d
cp -r .emacs.d ~/
cp .emacs ~/
