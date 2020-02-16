(defun toggle-truth()
  "Replace boolean tokens by their oposite value"
  (interactive)

  (save-excursion
    (goto-char (line-beginning-position))
    (while (search-forward "true" (line-end-position) t)
      (replace-match "false"))

    (while (search-forward "false" (line-end-position) t)
      (replace-match "true"))
    )
  )

(provide 'init-toggle-truth)
