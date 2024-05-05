(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(menu-bar-mode 0)
(tool-bar-mode 0)

(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

(require 'doom-themes)

(load-theme 'doom-dracula :no-confirm)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(doom-themes-visual-bell-config)

(set-face-attribute 'default nil :height 150)

(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq-default make-backup-files nil)

(require 'recentf)

(recentf-mode 1)

(setq recentf-max-menu-items 25)

(setq-default help-window-select t)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-startup-folded t)

(unless (package-installed-p 'org-bullets)
  (package-install 'org-bullets))

(require 'org-bullets)

(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)))

(require 'org-tempo)

(unless (package-installed-p 'ace-window)
  (package-install 'ace-window))

(unless (package-installed-p 'perspective)
  (package-install 'perspective))

(require 'perspective)

(global-set-key (kbd "C-x C-b") 'persp-list-buffers)

(customize-set-variable 'persp-mode-prefix-key (kbd "C-c M-p"))

(persp-mode 1)

(add-hook 'ibuffer-hook
	  (lambda ()
	    (persp-ibuffer-set-filter-groups)
	    (unless (eq ibuffer-sorting-mode 'alphabetic)
	      (ibuffer-do-sort-by-alphabetic))))

(unless (package-installed-p 'company)
  (package-install 'company))

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(require 'rainbow-delimiters)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))

(require 'evil-leader)

(global-evil-leader-mode 1)

(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "q q" 'save-buffers-kill-terminal)

(evil-leader/set-key
  "h f" 'describe-function
  "h k" 'describe-key
  "h v" 'describe-variable)

(evil-leader/set-key
  "b b" 'ibuffer
  "b n" 'next-buffer
  "b p" 'previous-buffer
  "b k" 'kill-buffer)

(evil-leader/set-key
  "w 1" 'delete-other-windows
  "w k" 'delete-window
  "w h" (lambda () (interactive) (split-window-below) (other-window 1))
  "w v" (lambda () (interactive) (split-window-right) (other-window 1))
  "w w" 'ace-window) ;; Switch between windows

(evil-leader/set-key
  "o l" 'org-open-at-point)

(defun my/switch-workspace-1 () "Switch to workspace 1" (interactive) (persp-switch-by-number 1))
(defun my/switch-workspace-2 () "Switch to workspace 2" (interactive) (persp-switch-by-number 2))
(defun my/switch-workspace-3 () "Switch to workspace 3" (interactive) (persp-switch-by-number 3))
(defun my/switch-workspace-4 () "Switch to workspace 4" (interactive) (persp-switch-by-number 4))
(defun my/switch-workspace-5 () "Switch to workspace 5" (interactive) (persp-switch-by-number 5))
(defun my/switch-workspace-6 () "Switch to workspace 6" (interactive) (persp-switch-by-number 6))
(defun my/switch-workspace-7 () "Switch to workspace 7" (interactive) (persp-switch-by-number 7))
(defun my/switch-workspace-8 () "Switch to workspace 8" (interactive) (persp-switch-by-number 8))
(defun my/switch-workspace-9 () "Switch to workspace 9" (interactive) (persp-switch-by-number 9))
(defun my/switch-workspace-10 () "Switch to workspace 10" (interactive) (persp-switch-by-number 10))

(evil-leader/set-key
  "p s" 'persp-switch
  "p S" 'persp-state-save
  "p l" 'persp-state-load
  "p n" 'persp-next
  "p p" 'persp-prev
  "p k" 'persp-kill
  "p 1" 'my/switch-workspace-1
  "p 2" 'my/switch-workspace-2
  "p 3" 'my/switch-workspace-3
  "p 4" 'my/switch-workspace-4
  "p 5" 'my/switch-workspace-5
  "p 6" 'my/switch-workspace-6
  "p 7" 'my/switch-workspace-7
  "p 8" 'my/switch-workspace-8
  "p 9" 'my/switch-workspace-9
  "p 0" 'my/switch-workspace-10)

(defun my/open-init-file ()
  "Open init.el file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(evil-leader/set-key
  "f i" 'my/open-init-file
  "f f" 'find-file
  "f r" 'recentf-open-files)

(defun my/create-shell ()
  "Create a shell buffer with a unique name."
  (interactive)
  (shell (concat "*shell-" (number-to-string (round (* 1000.0 (float-time (current-time))))) "*")))

(defun my/create-small-shell ()
  "Create a shell buffer in a window below current buffer."
  (interactive)
  (split-window-below)
  (other-window 1)
  (my/create-shell))

(evil-leader/set-key
  "t s" 'my/create-small-shell
  "t t" 'my/create-shell)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)

(evil-mode 1)

(evil-set-undo-system 'undo-redo)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(define-key evil-normal-state-map (kbd "ZS") (lambda () (interactive) (save-buffer)))

(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

(define-key evil-normal-state-map (kbd "M-v") 'yank)
(define-key evil-insert-state-map (kbd "M-v") 'yank)

(unless (package-installed-p 'which-key)
  (package-install 'which-key))

(require 'which-key)

(which-key-mode 1)

(unless (package-installed-p 'vertico)
  (package-install 'vertico))

(require 'vertico)

(vertico-mode 1)

(unless (package-installed-p 'marginalia)
  (package-install 'marginalia))

(require 'marginalia)

(marginalia-mode 1)
