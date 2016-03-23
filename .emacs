;; Top level directory for all pacakges
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Add dirtree - Directory navigator. Open using C-j
(require 'dirtree)
(require 'tree-mode)
(require 'windata)
(autoload 'dirtree "dirtree" "Add a directory to tree view" t)
(defun dirtree-home ()
  (interactive)
  (dirtree "~/" t)
  ;; Decrease dirtree by '13' units
  (execute-kbd-macro (read-kbd-macro "C-u 13 C-x {"))
  ;; Switch back to editor
  (execute-kbd-macro (read-kbd-macro "C-x o")))
(global-set-key (kbd "C-j") 'dirtree-home)

;; Auto-Complete and dependencies
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/dict")

;; autocomplete paired brackets
(electric-pair-mode 1)

;;Display line numbers
(global-linum-mode t)

;;Highlights matching symbols
(require 'highlight-symbol)
(define-globalized-minor-mode my-global-hsmode highlight-symbol-mode (lambda() (highlight-symbol-mode 1) ) ) 
(my-global-hsmode 1)

;; Convert tabs to spaces
(setq-default indent-tabs-mode nil)

;; Custom theme (when using the GUI)
(when window-system (set-frame-size (selected-frame) 150 40))

;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)

;; SMTP server for sending email, modify as required
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.rim.net")
 '(smtpmail-smtp-service 25)

 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
(put 'erase-buffer 'disabled nil)

;; MELPA -- Extremely slow so use with caution
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
   '("melpa" . "https://melpa.org/packages/")
   t)
  (package-initialize))
