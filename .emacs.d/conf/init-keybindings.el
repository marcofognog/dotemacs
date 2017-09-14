(global-set-key (kbd "C-x k") 'kill-this-buffer)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x m") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "s-V") 'helm-show-kill-ring)

(global-set-key (kbd "C-c f") 'magit-status)
(global-set-key (kbd "C-c d") 'magit-checkout)
(global-set-key (kbd "C-c s") 'magit-log-head)

(global-set-key (kbd "C-c p s a") 'helm-projectile-ack)
