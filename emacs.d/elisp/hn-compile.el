(defun hn-find-vc-root ()
  "Finds the version control root directory."
  (interactive)
  (progn
    (setq path (buffer-file-name))
    (if (equal path nil)
		(setq path default-directory))
    (unless (file-exists-p path)
      (setq path default-directory))
    (unless (file-directory-p path)
      (setq path (file-name-directory path)))
	(setq path (expand-file-name path))

    (setq test-path (concat path ".git"))
    (while (and (not (file-exists-p test-path)) (not (string-equal path "/")))
      (progn
		(setq path-split (split-string path "/"))
		(setq path-split (butlast path-split 1))
		(setq path (file-name-directory (mapconcat 'identity path-split "/")))
		(setq test-path (concat path ".git"))
		))
	(if (not (string-equal path "/"))
		(progn
		  (if (called-interactively-p 'any)
			  (message path))
		  (identity path)
		  )
	  )
	)
  )

(defun hn-kill-compile-buffer ()
  (if (get-buffer "*compilation*") ; If old compile window exists
	  (progn
		(delete-windows-on (get-buffer "*compilation*")) ; Delete the compilation windows
		(kill-buffer "*compilation*") ; and kill the buffers
		)
	)
  )

(defun hn-clean ()
  "Cleans the current project by calling \"make clean\"."
  (interactive)
  (progn
	(hn-kill-compile-buffer)
    (if (not (equal (hn-find-vc-root) nil))
		(progn
		  (setq old-path default-directory)
		  (setq default-directory (hn-find-vc-root))
		  (compile "make clean")
		  (setq default-directory old-path)
		  )
	  (if (called-interactively-p 'any)
		  (message "Did not find vc root directory")
		)
      )
    )
  )

(defun hn-compile ()
  "Compiles the current project by calling \"make all\"."
  (interactive)
  (progn
	(hn-kill-compile-buffer)
    (if (not (equal (hn-find-vc-root) nil))
		(progn
		  (setq old-path default-directory)
		  (setq default-directory (hn-find-vc-root))
		  (compile "make all")
		  (setq default-directory old-path)
		  (select-window (get-buffer-window "*compilation*"))
		  )
	  (if (called-interactively-p 'any)
		  (message "Did not find vc root directory")
		)
      )
    )
  )

(defun hn-tests ()
  "Runs the tests in current project by calling \"make tests\"."
  (interactive)
  (progn
	(hn-kill-compile-buffer)
    (if (not (equal (hn-find-vc-root) nil))
		(progn
		  (setq old-path default-directory)
		  (setq default-directory (hn-find-vc-root))
		  (compile "make tests")
		  (setq default-directory old-path)
		  (select-window (get-buffer-window "*compilation*"))
		  )
	  (if (called-interactively-p 'any)
		  (message "Did not find vc root directory")
		)
      )
    )
  )

(defun hn-help ()
  "Help for my .emacs configuratoin"
  (interactive)
  (progn
	(find-file "~/.emacs.d/help.rst")
	(with-current-buffer "help.rst"
	  (read-only-mode 1)
	  (cd "~")
	  )
	)
  )

(defun hn-tags ()
  "Creates a TAGS file in the root directory of the repository."
  (interactive)
  (if (not (equal (hn-find-vc-root) nil))
	  (progn
		(if (get-buffer "TAGS")
			(progn
			  (delete-windows-on (get-buffer "TAGS"))
			  (kill-buffer "TAGS")
			  )
		  )
		(setq old-path default-directory)
		(setq default-directory (hn-find-vc-root))
		(shell-command "ctags -e --recurse=yes --exclude=*.css --exclude=venv --exclude=node_modules --exclude=dist --exclude=tmp --exclude=cache_sources")
		(visit-tags-table (concat default-directory "/TAGS"))
		(setq default-directory old-path)
		)
	)
  )

;; (defun hn-build-tag-on-find-file ()
;;   (if (not (equal (hn-find-vc-root) nil))
;; 	  (if (not (get-buffer "TAGS")) (hn-tags) )
;; 	)
;; )

; (add-hook 'find-file-hook 'hn-build-tag-on-find-file)

(defun hn-keyboard-quit ()
  "Extends the normal keyboard-quit with removal of buffers not needed."
  (interactive)
  (setq buffer-names '(
					   "*Help*"
					   "*Backtrace*"
					   "*Completions*"
					   "*scratch*"
					   "*Buffer List*"
					   "*compilation*"
					   "*Warnings*"
					   "*Shell Command Output*"
					   "*Compile-Log*"
					   "*xref*"
					   "*vc-diff*"))
  (dolist (name buffer-names)
	(if (get-buffer name)
		(progn
		  (delete-windows-on (get-buffer name))
		  (kill-buffer name)
		  )
	  )
	)
  (kmb-kill-matching-buffers-no-ask "magit.*")
  (keyboard-quit)
  )

(defun hn-scratch-add (text)
  "Adds some text to the *scratch* buffer"
  (with-current-buffer "*scratch*"
	(goto-char (point-max))
	(insert text)
	)
  )

(defun hn-adjust-font-size (delta)
  "Increase or decrease font size for all GUI elements by DELTA."
  (interactive)
  (let* ((current-font (face-attribute 'default :height))
         (new-font (+ current-font delta)))
    (set-face-attribute 'default nil :height new-font)
    (message "Font size set to %d" new-font)))

(provide 'hn-compile)
