
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;
(require 'package) ;; You might already have this line
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
             ("marmalade" . "http://marmalade-repo.org/packages/")
             ("melpa" . "https://melpa.org/packages/")))
(package-initialize) ;; You might already have this line

(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "vendor" user-emacs-directory))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'init-evil)
(require 'init-projectile)
(require 'init-magit)
(require 'init-ui)
(require 'init-helm)
(require 'init-rspec)
(require 'init-general)
(require 'init-web-mode)
(require 'init-fognog)
(require 'init-ctrlnum)
(require 'init-toggle-truth)
(require 'init-numberfy-parens)
(require 'init-custom)
(require 'init-keybindings)
(require 'init-org-mode)
(require 'init-tramp-integration)
(require 'init-babel)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; mix format before saving
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(add-hook 'vue-mode-hook
          (lambda () (display-line-numbers-mode)))

;; Redefining this function makes it work -> possible bug in projectile?
(defun projectile-discover-projects-in-directory (directory)
  "Discover any projects in DIRECTORY and add them to the projectile cache.
This function is not recursive and only adds projects with roots
at the top level of DIRECTORY."
  (interactive
   (list (read-directory-name "Starting directory: ")))
  (let ((subdirs (directory-files directory t)))
    (mapcar
     (lambda (dir)
       (when (and (file-directory-p dir)
                  (not (member (file-name-nondirectory dir) '(".." "."))))
         (let ((default-directory dir)
               (projectile-cached-project-root dir))
           (when (projectile-project-p)
             (projectile-add-known-project (projectile-project-root))))))
     subdirs)))
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(eval-when-compile
  (require 'use-package))

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))
