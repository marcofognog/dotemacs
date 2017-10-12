(require 'magit)

;; Magit, dont fuck with me!
(setq magit-push-always-verify nil)

(defadvice magit-status (around magit-fullscreen activate)
  "Run magit in fullscreen mode."
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restore the previous window configuration and kill the magit buffer."
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(provide 'init-magit)
;;; init-magit.el ends here
