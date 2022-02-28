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

;; Org
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq org-agenda-files '("~/org/inbox.org"))

;; Keybindings
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c l") #'org-link)
(global-set-key (kbd "<f4>") #'org-capture)
(global-set-key (kbd "<f5>") #'org-agenda)

;; Capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
         "* TODO %?\n")
        ("n" "Note" entry (file+headline "~/org/inbox.org" "Notes")
         "* NOTE  %?\n")))

;; Todo keywords
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "CANCELED")))

;; Todos
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("CANCELED" . (:foreground "grey" :weight bold))))

;; Tags
(setq org-tag-alist
      '(("personal" . ?p)
        ("emacs" . ?e)))

;; Selectrum
(use-package selectrum
  :config
  (selectrum-mode 1))

;; Prescient
(use-package prescient
  :config
  (prescient-persist-mode))

;; Selectrum Prescient
(use-package selectrum-prescient
  :after (selectrum prescient)
  :config
  (selectrum-prescient-mode +1))
