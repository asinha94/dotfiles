(add-to-list 'load-path "~/.emacs.d/")
;; autocomplete paired brackets
(electric-pair-mode 1)
;;Display Highlighted line numbers
(global-linum-mode t)
;;(global-hl-line-mode t)
(require 'highlight-symbol)
(define-globalized-minor-mode my-global-hsmode highlight-symbol-mode (lambda() (highlight-symbol-mode 1) ) ) 
(my-global-hsmode 1)
;;(highlight-symbol-mode t)
;; Custom theme
(when window-system (set-frame-size (selected-frame) 150 40))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces)
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
(put 'erase-buffer 'disabled nil)
