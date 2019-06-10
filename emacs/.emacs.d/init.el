
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
