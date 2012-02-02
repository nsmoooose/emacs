Write extensions to emacs
=========================

Tasks:

* Create a good default emacs config file
* Create an install script for extensions
* email access?
* Help page with all my found hacks
* Special key sequence for my commands?
  Find a key sequence not already used by emacs and
  all my special things there.
* indenting short key
* Repeating commands
* Good combination to comment lines.
  C c C c
* Build TAGS file.

Things we want to do:

+-----------------+-------------------------------------------------------------+--------+
| Key combination | Description                                                 | Status |
+-----------------+-------------------------------------------------------------+--------+
| M-n o           | ff-find-other-file will open the other file (.c, .h, .cpp)  | *DONE* |
|                 | or the file in the #include statement on the current row.   |        |
+-----------------+-------------------------------------------------------------+--------+
| M-n t           | Build TAGS file by creating it into the root directory of   |        |
|                 | the current repository.                                     |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+
|                 |                                                             |        |
+-----------------+-------------------------------------------------------------+--------+


    A-p        undefined

    A-n
    A-n c      Clean. Defaults to "make clean"
    A-n b      Build. Defaults to "make all"
    A-n r      Rebuild. Defaults to "make clean all"
    A-n A-n    Next window
    A-n A-k    Kill line without placing it into the buffer
	A-n o      Open file in on line.  *DONE*
	A-n s      rgrep on marked word in current project (based on .git directory)
    C-c C-c    comment region


Good to know
------------

Debug:
++++++

The first thing you should do if you want to debug a problem is to set the variable
‘debug-on-error’ to t. You can do that by calling `M-x set-variable RET debug-on-error RET t’.
When you get an EmacsLisp error, this will pop up a BacktraceBuffer.



Total reconfiguration
---------------------

How do we acheive this?

Can we set this globally or must we define all these things on
per mode basis?

Reconfigure default emacs::

    C-s           Save
	C-o           Open
    Shift-arrows  Mark region
    tab           If region is marked indent
	shift + tab   If region is marked dedent
	C-c           copy
	C-k           kill remaining line
	C-v           yank
	C-space       Code completion
