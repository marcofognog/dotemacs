
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;
(require 'package) ;; You might already have this line
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
             ("marmalade" . "http://marmalade-repo.org/packages/")
             ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize) ;; You might already have this line

(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "vendor" user-emacs-directory))

(require 'init-evil)
(require 'init-projectile)
(require 'init-magit)
(require 'init-ui)
(require 'init-helm)
(require 'init-rspec)
(require 'init-general)
(require 'init-keybindings)
(require 'init-web-mode)
(require 'init-fognog)
(require 'init-ctrlnum)
(require 'init-numberfy-parens)
(require 'init-mail)
(require 'init-custom)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
