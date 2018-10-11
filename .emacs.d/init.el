
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
(require 'init-numberfy-parens)
(require 'init-mail)
(require 'init-custom)
(require 'init-keybindings)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Copy $PATH env from shell so elixir-mode can find mix in ~/./asdf folder
;; TODO: maybe it is possible to config mix path directly to elixir-mode?
(exec-path-from-shell-initialize)

;; mix format before saving
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

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
