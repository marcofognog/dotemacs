
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
(add-to-list 'package-archives
                          '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(package-initialize) ;; You might already have this line

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "vendor" user-emacs-directory))

(require 'init-evil)
(require 'init-projectile)
(require 'init-magit)
(require 'init-ui)
(require 'init-helm)
(require 'init-rspec)
