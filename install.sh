#!/bin/bash

if [[ ! -f /usr/bin/clangd ]] && [[ -f /etc/fedora_release ]]; then
	echo "Missing clangd for intellisense. Installing."
	sudo dnf install clang-tools-extra
fi

if [[ -d ~/.emacs.d ]]; then
	echo "Removing old .emacs.d folder"
	rm -fr ~/.emacs.d
fi
echo "Copying emacs scripts to the home folder: ~/.emacs.d"
cp -r emacs.d ~/.emacs.d
cp emacs.el ~/.emacs
