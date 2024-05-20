(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))

(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

(unless (package-installed-p 'nerd-icons)
  (package-install 'nerd-icons))

(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(unless (package-installed-p 'ace-window)
  (package-install 'ace-window))

(unless (package-installed-p 'perspective)
  (package-install 'perspective))

(unless (package-installed-p 'org-bullets)
  (package-install 'org-bullets))

(unless (package-installed-p 'company)
  (package-install 'company))

(unless (package-installed-p 'elfeed)
  (package-install 'elfeed))

(unless (package-installed-p 'orderless)
  (package-install 'orderless))

(unless (package-installed-p 'consult)
  (package-install 'consult))

(setq evil-want-keybinding nil)
(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'which-key)
  (package-install 'which-key))

(unless (package-installed-p 'vertico)
  (package-install 'vertico))

(unless (package-installed-p 'marginalia)
  (package-install 'marginalia))

(unless (package-installed-p 'multi-term)
  (package-install 'multi-term))

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(unless (package-installed-p 'neotree)
  (package-install 'neotree))

(unless (package-installed-p 'smartparens)
  (package-install 'smartparens))
