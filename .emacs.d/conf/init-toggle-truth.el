(defun toggle-truth()
  "Replace boolean tokens by their oposite value"
  (interactive)

  (setq end-search-point (line-end-position))

  (goto-char (line-beginning-position))
  (while (search-forward "true" end-search-point t)
    (replace-match "false"))
  )

(provide 'init-toggle-truth)
