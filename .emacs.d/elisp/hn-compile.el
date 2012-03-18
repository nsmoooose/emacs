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

(defun hn-clean ()
  "Cleans the current project by calling \"make clean\"."
  (interactive)
  (progn
    (if (not (equal (hn-find-vc-root) nil))
		(progn
		  (setq default-directory (hn-find-vc-root))
		  (compile "make clean")
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
    (if (not (equal (hn-find-vc-root) nil))
		(progn
		  (setq default-directory (hn-find-vc-root))
		  (compile "make all")
		  )
	  (if (called-interactively-p 'any)
		  (message "Did not find vc root directory")
		)
      )
    )
  )

(provide 'hn-compile)
