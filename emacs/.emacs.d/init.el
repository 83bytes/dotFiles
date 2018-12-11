
(require 'package) 
;; set the repos from where to get the packages
(setq package-enable-at-startup nil)

(package-initialize)
(setq package-archives '(("melpa-stable" . "http://stable.melpa.org/packages/")
				("org" . "http://orgmode.org/elpa/")
				("gnu" . "http://elpa.gnu.org/packages/")))

;; this line loads the emacs config from the org mode file.
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-threshold 50)
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(org-refile-targets (quote (("todoArchive.org" :maxlevel . 1))))
 '(package-selected-packages
   (quote
    (sml-mode xpm use-package switch-window start-menu smart-mode-line-powerline-theme pythonic php-mode markdown-mode magit linum-relative ledger-mode exwm evil-smartparens emms elpy dumb-jump dmenu anzu ac-geiser))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
