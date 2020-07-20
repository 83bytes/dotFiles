
(require 'package) 
;; set the repos from where to get the packages
(setq package-enable-at-startup nil)

(package-initialize)
(setq package-archives '(("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

;; this line loads the emacs config from the org mode file.
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; Add things to be moved to cofig.org here

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (shell . t)
   ))


;; Add things here. Move them to config later on
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
 '(helm-ag-base-command "rg --no-heading")
 '(helm-source-names-using-follow (quote ("Grep")))
 '(org-refile-targets (quote (("todoArchive.org" :maxlevel . 1))))
 '(package-selected-packages
   (quote
    (ranger zenburn-theme yaml-mode xpm wgrep-helm use-package tablist switch-window start-menu solarized-theme smooth-scrolling sml-mode smart-mode-line-powerline-theme restclient racket-mode pythonic php-mode org multi-web-mode markdown-mode magit linum-relative ledger-mode hideshow-org helm-swoop helm-projectile helm-ag go-mode go-autocomplete exwm exec-path-from-shell evil-smartparens emms elpy dumb-jump dmenu deft company-terraform color-theme beacon anzu ac-geiser))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
