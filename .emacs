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
(global-set-key (kbd "A-<down>") 'other-window)
(global-set-key (kbd "M-<down>") 'other-window)

(global-set-key (kbd "C-b") 'buffer-menu)
(global-set-key (kbd "M-å") 'compile)
(global-set-key (kbd "M-ä") 'recompile)
(global-set-key (kbd "C-+") 'hs-toggle-hiding)

(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
