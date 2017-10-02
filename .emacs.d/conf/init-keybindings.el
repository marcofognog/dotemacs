


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

(add-hook 'after-save-hook 'evil-force-normal-state)

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
                 `(ruby-mode
                   ,(rx (or "def" "it" "describe" "context" "{" "[")) ; Block start
                   ,(rx (or "}" "]" "end"))                  ; Block end
                   ,(rx (or "#" "=begin"))                   ; Comment start
                   ruby-forward-sexp nil)))

(defvar my-hs-hide nil "Current state of hideshow for toggling all.")

;;;###autoload
(defun toggle-hideshow-all () "Toggle hideshow all."
  (interactive)
  (setq my-hs-hide (not my-hs-hide))
  (if my-hs-hide
      (hs-hide-all)
    (hs-show-all)))

(global-set-key (kbd "C-c h") 'toggle-hideshow-all)
(global-set-key (kbd "C-c s") 'hs-show-block)

(global-set-key (kbd "C-x z") 'delete-other-windows)

(global-set-key (kbd "C-c a") 'helm-projectile-grep)

(provide 'init-keybindings)
