; Prevent the menu bar to be shown.
(menu-bar-mode 0)

;(set-face-attribute 'default nil :height 90)
;(setq-default truncate-lines t)

; Prevent emacs from writing backup files with ~ suffix.
(setq make-backup-files nil)

;(setq c-default-style "bsd")
;(setq-default c-default-style "bsd")
;(setq-default c-basic-offset 4)

; Trailing whitespace shall be displayed on every line.
(setq-default show-trailing-whitespace t)

; Show both row and column number.
(column-number-mode 1)

;(setq default-tab-width 4)

; Switch between opened windows.
; (global-set-key (kbd "A-<down>") 'other-window)
; (global-set-key (kbd "M-<down>") 'other-window)

; Open the other file (opens header file in #include statements)
(global-set-key (kbd "M-n o") 'ff-find-other-file)

(global-set-key (kbd "C-x C-b") 'buffer-menu)
; (global-set-key (kbd "M-å") 'compile)
; (global-set-key (kbd "M-ä") 'recompile)
; (global-set-key (kbd "C-+") 'hs-toggle-hiding)

(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)


;; (defun hn-walk-path (dir action)
;;   "Some doc"
;;   (interactive)
;;   (message "apa"))

;; (defun hn-project-dir ()
;;   "Finds the project directory based on the current buffers directory."
;;   (interactive)
;;   (if (eq (buffer-file-name) nil) (message "file doesnt exist"))
;;     (message "exist"))

;(message (buffer-file-name))

;; (defun hn-walk-path (dir action)
;;   "walk DIR executing ACTION with (dir file)"
;;   (cond ((file-directory-p dir)
;; 		 (or (char-equal ?/ (aref dir(1- (length dir))))
;; 			 (setq dir (file-name-as-directory dir)))
;; 		 (let ((lst (directory-files dir nil nil t))
;; 			   fullname file)
;; 		   (while lst
;; 			 (setq file (car lst))
;; 			 (setq lst (cdr lst))
;; 			 (cond ((member file '("." "..")))
;; 				   (t
;; 					(and (funcall action dir file)
;; 						 (setq fullname (concat dir file))
;; 						 (file-directory-p fullname)
;; 						 (walk-path fullname action)))))))
;; 		(t
;; 		 (funcall action
;; 				  (file-name-directory dir)
;; 				  (file-name-nondirectory dir)))))

;; (defun hn-walk-path-parent (startdir wanteddir action)
;;   "Walking up to the parent directory until a wanteddir directory is found and execute action there."
;;   )

;; (defun hn-walk-path-visitor (dir file)
;;   "Called by walk-path for each file found"
;;   (message (concat dir file)))

;; (hn-walk-path "~/.emacs.d/" 'hn-walk-path-visitor)

;; (defun hn-build-tags (directory)
;;   )

;; (defun hn-build-tags-vc
;;   "Build TAGS file according to the current vc system."
;;   (walk-path-parent TODO 'hn-build-tags)
;;   )

;; Use SHIFT + Arrow keys to move between frames.
(windmove-default-keybindings)

;; Other way to open files.
(ido-mode)