=============
Documentation
=============

The following features is provided by this emacs config:

Smart tabs
==========

Smart tabs to make source code readable independent on what tab size setting you have.
Here is full documentation:

http://emacswiki.org/emacs/SmartTabs

Keyboard quit
=============

C-g (keyboard-quit) is redirected to hn-keyboard-quit that in turn will kill several
buffers that you don't need. For example::

    Help, Backtrace, Completions, scratch

Compile commands
================

All the following commands are executed in the root directory of the current
git repository.

+------------+------------+--------------------------------------------------------+
| Command    | Binding    | Description                                            |
+------------+------------+--------------------------------------------------------+
| hn-clean   | M-p c      | Issue "make clean" which purpose is to remove all      |
|            |            | built files.                                           |
+------------+------------+--------------------------------------------------------+
| hn-compile | M-p b      | Issue "make all" which will build all targets for the  |
|            |            | current project.                                       |
+------------+------------+--------------------------------------------------------+
| hn-tests   | M-p u      | Issue "make tests" which is supposed to compile and    |
|            |            | execute all test cases for the current project.        |
+------------+------------+--------------------------------------------------------+

TAGS table
==========

M-p t (hn-tags) will create a new TAGS file and load that file as well. The command
require that you have ctags installed. The command are executed in the root directory
of the current git repository. This makes it convenient to do M-. (find-tag) directly
to move to the file where a function was defined.

Auto completion
===============

Auto completion lisp package from https://github.com/m2ym/auto-complete

It is well designed and all auto completions are based on opened files.
