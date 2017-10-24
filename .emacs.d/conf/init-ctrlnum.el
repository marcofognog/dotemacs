(require 'ctrlnum)

;; overwritting default maps (left-scroll)
(global-set-key (kbd "C-<next>") 'ctrlnum-next)
(global-set-key (kbd "C-<prior>") 'ctrlnum-previous)
(global-set-key [\C-\S-prior] 'ctrlnum-switch-order-prev)
(global-set-key [\C-\S-next] 'ctrlnum-switch-order-next)

;; Free up this key to use in ctrlnum
(define-key evil-motion-state-map (kbd "C-6") nil)

(ctrlnum-mode)
(provide 'init-ctrlnum)
