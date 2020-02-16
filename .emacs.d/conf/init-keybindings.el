(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x m") 'helm-M-x)

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c v") 'helm-show-kill-ring)

(global-set-key (kbd "C-c f") 'magit-status)

(global-set-key (kbd "M-u") 'previous-buffer)
(global-set-key (kbd "M-i") 'next-buffer)

(global-set-key (kbd "C-c q") 'projectile-run-eshell)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)

(global-set-key (kbd "C-c h") 'toggle-hideshow-all)
(global-set-key (kbd "C-c s") 'toggle-hideshow-show-block)

(global-set-key (kbd "C-x z") 'delete-other-windows)

(global-set-key (kbd "C-x k") 'kill-this-buffer)

(global-set-key (kbd "C-c r") 'rubocop-check-current-file)

(global-set-key (kbd "C-x 4") 'toggle-window-split)

(global-set-key (kbd "C-c e") 'delete-indentation)
(global-set-key (kbd "C-x t w") 'transpose-words)

(global-set-key (kbd "C-c t") (lambda () (interactive) (join-line -1)))

(global-set-key (kbd "C-+") 'er/contract-region)

(global-set-key (kbd "C-c l a") 'helm-projectile-grep)
(global-set-key (kbd "C-c l b") 'toggle-truth)

(global-set-key (kbd "C-c l l") 'display-unread-mail)
(global-set-key (kbd "C-c l j") 'notmuch-exec-offlineimap)
(global-set-key (kbd "C-c l m") 'notmuch)

(global-set-key (kbd "C-c l k") 'browse-url-xdg-open)

(global-set-key (kbd "C-c l d") 'fognog-go-to-downloads-dired)
(global-set-key (kbd "C-c l h") 'fognog-go-to-home-dired)

(global-set-key (kbd "C-c l n") 'fognog-notes)
(global-set-key (kbd "C-c l y") 'fognog-autocommit-notes)
(global-set-key (kbd "C-c l t") 'fognog-notes-add-week)

(global-set-key (kbd "C-c l p") 'fognog-switch-project)

(global-set-key (kbd "C-c l u") 'org-sort-by-todo)

(global-set-key (kbd "C-c l i") 'chmod-plus-x)

(global-set-key (kbd "C-c l q") 'helm-eshell-history)

(provide 'init-keybindings)
