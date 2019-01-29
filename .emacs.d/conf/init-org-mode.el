(setq org-todo-keywords
      '((sequence "|" "DONE" "CANCELLED")))

(defun org-sort-by-todo()
  "Sorts entries by TODO state"
  (interactive)
  (org-sort-entries nil ?o)
  )

(provide 'init-org-mode)
