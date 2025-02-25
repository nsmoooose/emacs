#!/bin/bash
if [[ -d ~/.emacs.d ]]; then
	echo "Removing old .emacs.d folder"
	rm -fr ~/.emacs.d
fi
echo "Copying emacs scripts to the home folder: ~/.emacs.d"
cp -r emacs.d ~/.emacs.d
cp emacs.el ~/.emacs
