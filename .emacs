(add-to-list 'load-path "~/.emacs.d/elisp")


(require 'smart-tabs-mode)
;; C/C++
(add-hook 'c-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)
;; JavaScript
(add-hook 'js2-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice js2-indent-line js2-basic-offset)




(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tab-width 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
