#!/bin/bash
echo "Copying emacs scripts to the home folder: ~/.emacs.d"
[ -d ~/.emacs.d ] || mkdir ~/.emacs.d
cp my_config.el ~/.emacs.d/
echo "Include the following in ~/.emacs"
echo ";; Tell emacs where is your personal elisp lib dir"
echo ";; this is the dir you place all your extra packages"
echo "(add-to-list 'load-path \"~/.emacs.d/\")"
echo ""
echo ";; load the packaged named my_config."
echo "(load \"my_config\")"
