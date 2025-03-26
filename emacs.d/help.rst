======================
 Help for Emacs setup
======================

Introduction
============

Keybindings
===========

These keybindings works are general and work in many places::

  M-p h        Open this help pag

  C-g          Abort commands and closes unneeded buffers.
  M-p e        List errors
  M-p t        Open Treemacs sidebar
  M-p c        'make clean'
  M-p b        'make'
  M-p u        'make tests'

  C-+          Increase font size
  C--          Decrease font size

  C-x <up>     Move to buffer above
  C-x <down>   Move to buffer below
  C-x <left>   Move to buffer left
  C-x <right>  Move to buffer right

Git
===

To get you started open a source code file and use::

  M-p g

You are now inside git where you can do a lot of useful things::

  s    Stage a file or a hunk of a file (in diff mode)
  k    discard changes in file
  d d  Diff unstaged changes
  d s  Diff staged changes
  c c  Commit changes
  c a  Commit and amend
  P p  Push changes to origin

Treemacs
========

These commands works only in the treemacs window that
exist to the left. Open it with::

  M-p t

Keybindings::

  C-c C-p a    Add project to the side bar

Flycheck
========

This is used for code checks.

Noteworthy commands::

  M-x lsp-treemacs-errors-list   List all errors for the current project

Packages
========

How to install new packages::

  M-x package-list-packages        List all packages

Then you can do::

  i     Mark for installation
  x     Execute the installation
