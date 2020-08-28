(add-to-list 'load-path "~/.emacs.d/elisp")

;; ******************************************************
;; SMART TABS configuration.
(require 'smart-tabs-mode)
;; C/C++
(add-hook 'c-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)
;; JavaScript
(add-hook 'js2-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice js2-indent-line js2-basic-offset)

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
;; ESS R programming environment.
(add-to-list 'load-path "~/.emacs.d/ESS/lisp/")
(load "ess-site")


;; ******************************************************
;; Want clock and battery information in status bar.
(setq display-time-24hr-format t)
(display-time)
(display-battery-mode)

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
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(rst-level-face-base-color "black")
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tab-width 4)
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
   '("melpa" . "http://melpa.org/packages/")
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

;; ******************************************************
;; Install desired packages:
;;    auto-complete

; list the packages you want
(setq package-list '(auto-complete))

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
;; Configure auto-complete

;; Make C-n, C-p work with popups as well.
(setq ac-use-menu-map t)
;; Don't ignore upper and lower case
(setq ac-ignore-case nil)
