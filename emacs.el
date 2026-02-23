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
(display-buffer "*scratch*")
(hn-scratch-add "Detecting what Emacs packages that should be installed\n")

(setq package-list '(smart-tabs-mode))

;; * kmb = kill matching buffer. Kill buffer without confirmation
(setq package-list (append package-list '(kmb)))

;; treemacs for project sidebar
(setq package-list (append package-list '(treemacs)))

;; Lorem-ipsum functions for generating chunks of texts
(setq package-list (append package-list '(lorem-ipsum)))

;; Jinja2-mode for those files with extension .j2
(setq package-list (append package-list '(jinja2-mode)))

;; ninja-mode color for ninja build files
(setq package-list (append package-list '(ninja-mode)))

;; YAML file support
(setq package-list (append package-list '(yaml-mode)))

;; Support for Dockerfile and LSP
(when (or (file-exists-p "/usr/bin/docker") (file-exists-p "/usr/bin/podman"))
  (setq package-list (append package-list '(dockerfile-mode lsp-docker))))

;; Support for Julia
(when (file-exists-p "/usr/bin/julia")
  (setq package-list (append package-list '(lsp-julia))))

;; Support for GIT using magit
(when (file-exists-p "/usr/bin/git")
  (setq package-list (append package-list '(magit))))

;; Support for the R programming language. Emacs Speak Statistics (R)
(when (file-exists-p "/usr/bin/R")
  (setq package-list (append package-list '(ess))))

;; Support for Rust language
(when (file-exists-p "/usr/bin/cargo")
  (setq package-list (append package-list '(rust-mode))))

;; Support for Golang
(when (file-exists-p "/usr/bin/go")
  (setq package-list (append package-list '(go-mode))))

;; Support for Java
(when (file-exists-p "/usr/bin/java")
  (setq package-list (append package-list '(lsp-java))))

;; Support for Java
(when (file-exists-p "/usr/bin/pdflatex")
  (setq package-list (append package-list '(lsp-latex))))

;; Support LSP mode with the clangd toolkit.
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
(global-set-key (kbd "M-p e") 'lsp-treemacs-errors-list)

(global-set-key (kbd "C-+") (lambda () (interactive) (hn-adjust-font-size 10)))
(global-set-key (kbd "C--") (lambda () (interactive) (hn-adjust-font-size -10)))

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
