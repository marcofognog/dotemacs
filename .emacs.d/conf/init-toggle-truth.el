(defun toggle-truth()
  "Replace boolean tokens by their oposite value"
  (interactive)

  (goto-char (line-beginning-position))
  (while (search-forward "true" (line-end-position) t)
    (replace-match "false"))
  )

(provide 'init-toggle-truth)
