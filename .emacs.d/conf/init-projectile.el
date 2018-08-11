
(require 'projectile)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/projetos/"))

(projectile-global-mode)

;;; proojectile-helm
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'projectile-dired)
(setq helm-projectile-sources-list '(helm-source-projectile-buffers-list
				     helm-source-projectile-files-list))

(provide 'init-projectile)
;;; init-projectile.el ends here
