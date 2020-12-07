(require 'evil)

(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)

(evil-mode 1)
(provide 'init-evil)
