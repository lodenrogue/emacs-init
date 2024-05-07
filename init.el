(org-babel-load-file
 (expand-file-name "config.org" "~/.emacs.d"))

;;;;;; Golden Ratio (Auto Window Resizing) ;;;;;;

;;(unless (package-installed-p 'golden-ratio)
;;(package-install 'golden-ratio))
;;
;;(require 'golden-ratio)
;;
;;(add-to-list 'golden-ratio-extra-commands 'ace-window)
;;
;;(golden-ratio-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(elfeed sudoku evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
