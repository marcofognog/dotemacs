(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x m") 'helm-M-x)

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "s-V") 'helm-show-kill-ring)

(global-set-key (kbd "C-c f") 'magit-status)

(global-set-key (kbd "C-c p s a") 'helm-projectile-ack)

(global-set-key (kbd "M-u") 'previous-buffer)
(global-set-key (kbd "M-i") 'next-buffer)

(global-set-key (kbd "C-c q") 'projectile-run-eshell)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)

(global-set-key (kbd "C-c h") 'toggle-hideshow-all)
(global-set-key (kbd "C-c s") 'toggle-hideshow-show-block)

(global-set-key (kbd "C-x z") 'delete-other-windows)

(global-set-key (kbd "C-c a") 'helm-projectile-grep)

(global-set-key (kbd "C-x k") 'kill-this-buffer)

(global-set-key (kbd "C-c e") 'delete-indentation)

(global-set-key (kbd "C-c r") 'rubocop-check-current-file)

(global-set-key (kbd "C-x 4") 'toggle-window-split)

(global-set-key (kbd "C-x t w") 'transpose-words)

(global-set-key (kbd "C-c t") (lambda () (interactive) (join-line -1)))

(provide 'init-keybindings)
