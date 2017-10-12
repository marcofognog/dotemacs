
(require 'projectile)


(projectile-global-mode)

;;; proojectile-helm
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'projectile-dired)
(setq helm-projectile-sources-list '(helm-source-projectile-buffers-list
				     helm-source-projectile-files-list))

(provide 'init-projectile)
;;; init-projectile.el ends here
