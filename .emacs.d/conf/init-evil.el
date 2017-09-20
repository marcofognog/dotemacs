(add-to-list 'load-path "~/.emacs.d/vendor/evil")
(require 'evil)

;; Free up this key to use in ctrlnum
(define-key evil-motion-state-map (kbd "C-6") nil)


(evil-mode 1)
(provide 'init-evil)
