;;; init.el --- Init file -*- lexical-binding: t -*-

;; User info
(setq user-full-name "Ryan Todd")
(setq user-mail-address "r.todd.dev@gmail.com")

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
(setq-default tab-width 4)
(setq-default indent-line-function 'insert-tab)

;; Show parentheses
(show-paren-mode 1)

;; Don't ask for yes or no ask for y or n instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Ask to confirm when killing emacs
(setq confirm-kill-emacs 'y-or-n-p)

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

;; Agenda
(setq org-agenda-prefix-format
      '((todo . " ")
        (tags . " ")
        (agenda . " ")))

;; Hide tags
(setq org-agenda-hide-tags-regexp "")

;; Company
(use-package company
  :config
  (global-company-mode))

;; Vertico
(use-package vertico
  :config
  (vertico-mode))

;; Orderless
(use-package orderless
  :custom
  (completion-styles '(basic substring partial-completion flex))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Savehist -- Vertico saves recently visited files
(use-package savehist
  :config
  (savehist-mode))

;; Marginalia
(use-package marginalia
  :config
  (marginalia-mode))

;; Consult
(use-package consult
  :bind
  ("<f1>" . consult-apropos)           ;; Replacement for apropos
  ("M-s l" . consult-line)             ;; Search for matching line
  ("M-g g" . consult-goto-line)        ;; Go to line number
  ("M-g o" . consult-outline))         ;; Go to heading Org-Mode

;; Embark
(use-package embark
  :bind
  ("C-." . embark-act)
  ("C-;" . embark-dwim)
  ("C-h B" . embark-bindings))

;; Embark Consult
(use-package embark-consult
  :after (embark consult))

;; Smartparens
(use-package smartparens
  :config
  (smartparens-mode)
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil))

;; Projectile
(use-package projectile
  :bind
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode 1))

;; Dashboard
(use-package dashboard
  :custom
  (dashboard-items
   '((recents  . 7)
     (projects . 7)
     (agenda . 5)))
  (dashboard-set-heading-icons t)
  (dashboard-set-init-info nil)
  (dashboard-set-footer nil)
  (dashboard-agenda-prefix-format " ")
  (dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
  :config
  (dashboard-modify-heading-icons
   '((recents . "file-text")
     (projects . "book")))
  (dashboard-setup-startup-hook))

;; Neotree
(use-package neotree
  :custom
  (neo-theme 'icons)
  :bind
  ("<f8>" . neotree-toggle))

