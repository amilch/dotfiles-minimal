;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General Config
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-language-environment "UTF-8")

;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; disable backup and lockfiles
(setq create-lockfiles nil)
(setq make-backup-files nil)

(setq network-security-level 'high) ;; Security hardened settings

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq network-security-level 'high)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Optics
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; minor display configs
(setq linum-format "%4d ")
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Plugins
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helm
  :ensure t
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-list 50)
  (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
  (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x b" . helm-mini)
   ("C-x r l" . helm-bookmarks)
   ("M-y" . helm-show-kill-ring)))

(use-package helm-org
  :ensure t)

(use-package helm-swoop
  :ensure t
  :bind (("C-c o" . helm-swoop-all)
	 ("C-s" . helm-swoop)
	 ("C-r" . helm-resume)))

(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :demand t
  :bind ("M-t" . helm-projectile-find-file)
  :config
  (helm-projectile-on)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package helm-make
  :ensure t
  :bind (("C-c K" . helm-make)))
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package company
  :ensure t
  :diminish company-mode
  :init
  (setq company-idle-delay nil
	company-tooltip-align-annotations t)
  :hook (after-init . global-company-mode)
  :bind
  (:map prog-mode-map
	("C-i" . company-indent-or-complete-common)
	("C-M-i" . completion-at-point)))

;; (use-package company-lsp
;;   :ensure t
;;   :defer)

;; (use-package lsp-mode
;;   :ensure t
;;   :commands lsp
;;   :hook ((before-save . lsp-format-buffer)
;; 	 (before-save . lsp-organize-imports))
;;   :bind (("C-c d" . lsp-describe-thing-at-point)
;; 	 ("C-c e n" . flymake-goto-next-error)
;; 	 ("C-c e p" . flymake-goto-prev-error)
;; 	 ("C-c e r" . lsp-find-references)
;; 	 ("C-c e R" . lsp-rename)
;; 	 ("C-c e i" . lsp-find-implementation)
;; 	 ("C-c e t" . lsp-find-type-definition)))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package ztree
  :ensure t
  :defer t)

(use-package dumb-jump
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :defer t)

(use-package git-timemachine
  :ensure t
  :defer t)

; use C-? to redo changes
(use-package undo-tree
  :ensure t
  :init
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; NeoTree
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package neotree
  :ensure t
  :defer t
  :config
  (setq neo-theme 'arrow))

(defun my/neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
	(file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
	(if (neo-global--window-exists-p)
	    (progn
	      (neotree-dir project-dir)
	      (neotree-find file-name)))
      (message "Could not find git project root."))))

(global-set-key [f8] 'my/neotree-project-dir)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Keybindings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my/kill-this-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'my/kill-this-buffer)
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop) ; Indent selection by one tab length
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)  ; De-indent selection by one tab length
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(global-set-key "\C-ck" #'compile)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Filetype Adjustments
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; see https://www.emacswiki.org/emacs/AutoModeAlist#toc6
(add-to-list 'auto-mode-alist '("\\.sh\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("/emacs\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("/?.bashrc\\'" . shell-script-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Web Backend
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package typoscript-mode
  :defer t
  :ensure t)

(use-package php-mode
 :ensure t
 :mode
 ("\\.php\\'" . php-mode))

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(use-package phpunit
 :ensure t)

(provide 'lang-php)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Dart + Flutter
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dart-mode
  :ensure t
  ;; :init
  ;; (setq lsp-dart-analysis-sdk-dir "~/.local/share/flutter/bin/cache/dark-sdk/")
  :custom
  (dart-format-on-save t)
  (dart-sdk-path "~/.local/share/flutter/bin/cache/dark-sdk/"))
  ;; :hook ((dart-mode . lsp)))

(use-package flutter
  :ensure t
  :after dart-mode
  :custom
  (flutter-sdk-path "~/.local/share/flutter/")
  :bind
  (:map dart-mode-map
	("C-M-x" . #'flutter-run-or-hot-reload)))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Latex
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package auctex
  :defer t
  :ensure t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default Tex-master nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Markdown
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . gfm-mode))
  :init (setq markdown-command "pandoc"))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Yaml
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package yaml-mode
  :ensure t
  :mode (("\\.yml\\'" . yaml-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

"Stop the org-level headers from increasing in height relative to the other text."
(defun my/org-mode-fonts-hook ()
  (dolist (face '(outline-1
                  outline-2
                  outline-3
                  outline-4
                  outline-5
		  outline-6
		  outline-7))
    (set-face-attribute face nil :weight 'normal)))
(add-hook 'org-mode-hook 'my/org-mode-fonts-hook)

(use-package org-bullets
  :commands org-bullets-mode
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode)
  (setq org-bullets-bullet-list '("•" "•" "•" "•" "•")))

(use-package htmlize
  :ensure t)

(setq org-agenda-files (list "/home/user/vault/org/"))
(setq org-startup-indented t)
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq calendar-week-start-day 1)
(setq org-duration-format (quote h:mm))
(setq org-clock-into-drawer nil)
(setq org-hide-emphasis-markers t)
(setq org-agenda-default-appointment-duration 60)

(defun my/insert-custom-clock-entry ()
  (interactive)
  (insert "CLOCK: ")
  (org-time-stamp-inactive)
  (insert "--")
  ;; Inserts the current time by default.
  (let ((current-prefix-arg '(4))) (call-interactively 'org-time-stamp-inactive))
  (org-ctrl-c-ctrl-c))

(defun my/insert-date-start-clock ()
  (interactive)
  (org-insert-time-stamp (current-time))
  (org-clock-in))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; End of config
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e47c0abe03e0484ddadf2ae57d32b0f29f0b2ddfe7ec810bd6d558765d9a6a6c" "9d54f3a9cf99c3ffb6ac8e84a89e8ed9b8008286a81ef1dbd48d24ec84efb2f1" "6cbf6003e137485fb3f904e76fb15bc48abc386540f43f54e2a47a9884e679f6" default)))
 '(org-agenda-custom-commands
   (quote
    (("w" "Todos this week and overdue" agenda ""
      ((org-agenda-span
	(quote week))
       (org-agenda-start-on-weekday 1)
       (org-agenda-entry-types
	(quote
	 (:deadline :scheduled))))))))
 '(org-extend-today-until 3)
 '(package-selected-packages
   (quote
    (company-lsp helm-make helm-ag yaml-mode git-timemachine helm-swoop helm-projectile projectile flycheck-phpstan typoscript-mode htmlize markdown-mode auctex magit ztree dump-jump neotree counsel org-bullets helm-org which-key use-package smart-mode-line-powerline-theme helm flycheck doom-themes doom-modeline company ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
