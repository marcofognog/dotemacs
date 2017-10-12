(defvar fognog-toggle-fold-all nil "Current state of hideshow for toggling all blocks.")
(defvar fognog-toggle-fold-block nil "Current state of hideshow for toggling block.")

(defun toggle-hideshow-all () "Toggle hideshow all."
  (interactive)
  (setq fognog-toggle-fold-all (not fognog-toggle-fold-all))
  (if fognog-toggle-fold-all
      (hs-hide-all)
    (hs-show-all)))

(defun toggle-hideshow-show-block() "Toggle hideshow all."
  (interactive)
  (setq fognog-toggle-fold-block (not fognog-toggle-fold-block))
  (if fognog-toggle-fold-block
      (hs-hide-block)
    (hs-show-block)))

(defun reverse-update-emacs-conf()
  (interactive)
  (async-shell-command "cd ~/projetos/dotemacs/ && make reverse-install"))

(defun update-emacs-conf()
  (interactive)
  (async-shell-command "cd ~/projetos/dotemacs/ && make install"))

(provide 'init-fognog)
