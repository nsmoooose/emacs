(add-to-list 'load-path "~/.emacs.d/elisp")

;; ******************************************************
;; My own compile commands that always are invoked in the
;; root directory of the git repository.
(require 'hn-compile)

;; ******************************************************
;; Make M-f behave a little bit more sane.
(require 'misc)
(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "C-<right>") 'forward-to-word)

;; ******************************************************
;; Easier commands to switch between windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; ******************************************************
;; Pressing any key after a selection is made will kill all
;; that text and replace it with the newly entered text.
(delete-selection-mode 1)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(compilation-scroll-output (quote first-error))
 '(custom-enabled-themes '(modus-vivendi))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(rst-level-face-base-color "black")
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rst-level-1 ((t (:weight bold))))
 '(rst-level-2 ((t (:weight bold))))
 '(rst-level-3 ((t (:weight bold))))
 '(rst-level-4 ((t (:weight bold))))
 '(rst-level-5 ((t (:weight bold))))
 '(rst-level-6 ((t (:weight bold)))))

;; ******************************************************
;; Alter location of backup files that starts with #
;; This since it will confuse some tools (Ember.js)
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))
;; (setq create-lockfiles nil)




;; ******************************************************
;; Install desired packages:
;; * smart-tabs-mode = indent with tabs and align with spaces
;; * kmb = kill matching buffer. Kill buffer without confirmation
;; * magit = git tool
;; * ess = emacs speak statistics (R)
;; * dockerfile-mode = Syntax highlighting for Dockerfiles
;; * go-mode = major mode for the Go programming language
;; * rust-mode = major mode for the Rust programming language
(display-buffer "*scratch*")
(hn-scratch-add "Detecting what Emacs packages that should be installed\n")

(setq package-list '(smart-tabs-mode kmb treemacs dockerfile-mode))

(when (file-exists-p "/usr/bin/git")
  (setq package-list (append package-list '(magit))))
(when (file-exists-p "/usr/bin/R")
  (setq package-list (append package-list '(ess))))
(when (file-exists-p "/usr/bin/cargo")
  (setq package-list (append package-list '(rust-mode))))
(when (file-exists-p "/usr/bin/go")
  (setq package-list (append package-list '(go-mode))))
(when (file-exists-p "/usr/bin/clangd")
  (setq package-list (append package-list '(lsp-mode flycheck lsp-treemacs lsp-pyright lsp-ui))))

;; ******************************************************
;; Emacs package repository used with 'list-packages'
(hn-scratch-add "Fetching packages")

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa-stable" . "https://stable.melpa.org/packages/")
   t)
  (package-initialize))

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

(hn-scratch-add " ... downloaded\n")

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
	(hn-scratch-add (concat "Installing: " (symbol-name package)))
    (package-install package)
	(hn-scratch-add " ... installed\n")
	)
  )

; This package is needed for 'kmb-kill-matching-buffers-no-ask'
; when pressing C-g.
(require 'kmb)

(global-set-key (kbd "C-g") 'hn-keyboard-quit)
(global-set-key (kbd "M-p h") 'hn-help)
(global-set-key (kbd "M-p t") 'treemacs)

(when (file-exists-p "/usr/bin/git")
  (global-set-key (kbd "M-p g") 'magit-status))

(when (file-exists-p "/usr/bin/make")
  (global-set-key (kbd "M-p c") 'hn-clean)
  (global-set-key (kbd "M-p b") 'hn-compile)
  (global-set-key (kbd "M-p u") 'hn-tests))

;; (when (file-exists-p "/usr/bin/ctags")
;;  (global-set-key (kbd "M-p t") 'hn-tags))

(when (file-exists-p "/usr/bin/clangd")
  (use-package lsp-mode
	:ensure t
	:hook ((c-mode c++-mode) . lsp)
	:commands lsp))

(defun open-my-help ()
  "Open a specific file when no files are provided at startup."
  (when (equal (length command-line-args) 1)
    (hn-help)
	)
  )

(add-hook 'emacs-startup-hook 'open-my-help)
