;; Install Packages ;;
(load-file "~/.emacs.d/install-packages.el")

(org-babel-load-file
 (expand-file-name "config.org" "~/.emacs.d"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/gtd/projects.org" "~/gtd/inbox.org"))
 '(package-selected-packages '(ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
