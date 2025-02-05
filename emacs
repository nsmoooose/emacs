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


;; ******************************************************
;; Install desired packages:
;;    auto-complete

;; list the packages you want
;; * magit = git tool
;; * smart-tabs-mode = indent with tabs and align with spaces
;; * ess = emacs speak statistics (R)
(setq package-list '(magit smart-tabs-mode ess))

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
;; Emacs package repository used with 'list-packages'
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa-stable" . "https://stable.melpa.org/packages/")
   t)
  (package-initialize))

;; ******************************************************
;; Alter location of backup files that starts with #
;; This since it will confuse some tools (Ember.js)
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))
;; (setq create-lockfiles nil)

; list the repositories containing them
;(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
;                         ("gnu" . "http://elpa.gnu.org/packages/")
;                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
;(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; ******************************************************
;; SMART TABS configuration.
;; (smart-tabs-insinuate 'c 'c++ 'java 'javascript 'ruby 'nxml)
