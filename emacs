;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

(set-language-environment "UTF-8")

;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))

;; Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))


;; Window switching
(use-package ace-window
  :ensure t)

;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; minor display configs
(setq linum-format "%4d ")
(add-hook 'prog-mode-hook 'linum-mode)

;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-list 50)
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x b" . helm-mini)))
;; (use-package helm-org
;;   :ensure t)

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; autocomplete
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode))

;; syntax checking
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; disable backup and lockfiles
(setq create-lockfiles nil)
(setq make-backup-files nil)

;;; Keybindings
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop) ; Indent selection by one tab length
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)  ; De-indent selection by one tab length
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x o") 'ace-window)
(define-key global-map "\C-ca" 'org-agenda)

;; org-mode
(setq org-agenda-files (list "c:/Users/user/vault/org"))
(setq org-bullets-bullet-list '("■" "◆" "▲" "▶")) ;; Prettier Bullets for org-mode
(setq org-startup-indented t) ;; Keep the indentation well structured
(setq org-refile-targets '((org-agenda-files :maxlevel . 3))) ; Refile to all agenda files

;; org-mode ical export
(setq org-icalendar-stor-UID t
      org-icalendar-use-scheduled t
      org-icalendar-include-todo "all"
      org-icalendar-combined-agenda-file "~/../../vault/org/calendar.ics")

;; org-mode todo-keywords
(setq org-todo-keywords
      '((sequence "TODO" "TODAY" "|" "DONE")
	(sequence "WAIT")))
(setq org-todo-keyword-faces
      '(("TODAY" . "orange") ("WAIT" . "magenta")))
;; org-mode tags
(setq org-tag-persistent-alist '( (:startgroup . nil)
				  ("@thf" . ?t)
				  ("@xberg" . ?x)
				  ("@fhain" . ?f)
				  ("@nk" . ?n)
				  ("@dahlem" . ?d)
				  (:endgroup . nil)
				  ("opt" . ?o)))

(setq calendar-week-start-day 1) ;; Start week on monday

;; org-mode capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/../../vault/org/inbox.org")
	 "* TODO %?\nSCHEDULED: %t" :empty-lines 1)
	("T" "Todo with Clipboard" entry (file "~/../../vault/org/inbox.org")
	 "* TODO %?\nSCHEDULED: %t\n%c" :empty-lines 1)
	("s" "Scheduled Todo" entry (file "~/../../vault/org/inbox.org")
	 "* TODO %?\nSCHEDULED: %^t" :empty-lines 1)
	("S" "Scheduled Todo with Clipboard" entry (file "~/../../vault/org/inbox.org")
	 "* TODO %?\nSCHEDULED: %^t\n%c" :empty-lines 1)
	("e" "Event" entry (file "~/../../vault/org/inbox.org")
	 "* %?\nSCHEDULED: %^t" :empty-lines 1)
	("E" "Event With Clipboard" entry (file "~/../../vault/org/inbox.org")
	 "* %?\nSCHEDULED: %^t\n%c" :empty-lines 1)))

;; org-mode custom agenda commands
;; refer to https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html
(setq org-agenda-custom-commands
      '(("o" "overview"
	 ((agenda "" ((org-agenda-span 1)
		      (org-agenda-time-grid nil)))
  ))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-org which-key use-package smart-mode-line-powerline-theme helm flycheck doom-themes doom-modeline company ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
