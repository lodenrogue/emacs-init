(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Open emacs in full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Font size
(set-face-attribute 'default nil :height 150)

;; Display relative line numbers
(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Don't create backup files
(setq-default make-backup-files nil)

;;;;;; Recent Files ;;;;;;

(require 'recentf)

(recentf-mode 1)

(setq recentf-max-menu-items 25)

;;;;;; -------------- ;;;;;;

;;;;;; Company (Autocomplete) ;;;;;;

(unless (package-installed-p 'company)
  (package-install 'company))

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

;;;;;; -------------- ;;;;;;

;;;;;; Ace Window (Window Switching) ;;;;;;

(unless (package-installed-p 'ace-window)
  (package-install 'ace-window))

;;;;;; -------------- ;;;;;;

;;;;;; Evil Leader Key ;;;;;;

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))

;; This must come before evil
(require 'evil-leader)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

;; Quit Bindings ;;
(evil-leader/set-key
  "q q" 'save-buffers-kill-terminal)

;; Help Bindings ;;
(evil-leader/set-key
  "h f" 'describe-function
  "h k" 'describe-key) 

;; Buffer Bindings ;;
(evil-leader/set-key
  "b b" 'ibuffer
  "b n" 'next-buffer
  "b p" 'previous-buffer
  "b k" 'kill-buffer)

;; Window Bindings ;;
(evil-leader/set-key
  "w 1" 'delete-other-windows
  "w k" 'delete-window
  "w h" (lambda () (interactive) (split-window-below) (other-window 1))
  "w v" (lambda () (interactive) (split-window-right) (other-window 1))
  "w w" 'ace-window) ;; Switch between windows

;; File Bindings ;;
(defun my/open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
  
(evil-leader/set-key
  "f i" 'my/open-init-file
  "f o" 'find-file
  "f r" 'recentf-open-files)

;; Terminal Bindings ;;
(defun my/create-shell ()
  "Create a shell buffer with a unique name."
  (interactive)
  (shell (concat "*shell-" (number-to-string (round (* 1000.0 (float-time (current-time))))) "*")))

(defun my/create-small-shell ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (my/create-shell))

(evil-leader/set-key
  "t s" 'my/create-small-shell
  "t t" 'my/create-shell)

;;;;;; -------------- ;;;;;;

;;;;;; Evil ;;;;;;

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "ZS") (lambda () (interactive) (save-buffer)))
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

(evil-mode 1)

;;;;;; -------------- ;;;;;;

;;;;;; Doom Themes ;;;;;;

(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

(require 'doom-themes)

(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; theme may have their own settings.
(load-theme 'doom-dracula :no-confirm)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;;;;;; -------------- ;;;;;;

;;;;;; Rainbow Delimiters ;;;;;;

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(require 'rainbow-delimiters)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;;;;; -------------- ;;;;;;

;;;;;; Which Key (Key Binding Suggestions) ;;;;;;

(unless (package-installed-p 'which-key)
  (package-install 'which-key))

(require 'which-key)

(which-key-mode)

;;;;;; -------------- ;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
