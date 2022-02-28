;;; init.el --- Init file -*- lexical-binding: t -*-

;; Don't create backup files
(setq make-backup-files nil)

;; Don't create lockfiles
(setq-default create-lockfiles nil)

;; Set mac modifier keys
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;; Delete selection on keypress
(delete-selection-mode 1)

;; Files should end in a newline
(setq require-final-newline t)

;; Turn off cursor alarm
(setq ring-bell-function 'ignore)

;; Don't use tabs
(setq-default indent-tabs-mode nil)

;; Show parentheses
(show-paren-mode 1)

;; Don't ask for yes or no ask for y or n instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Doom-themes
(use-package doom-themes
  :config
  (load-theme 'doom-palenight t))

;; Doom Modeline
(use-package doom-modeline
  :config
  (doom-modeline-mode))
