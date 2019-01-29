(setq org-todo-keywords
      '((sequence "|" "DONE" "CANCELLED")))

(defun org-sort-by-todo()
  "Sorts entries by TODO state"
  (interactive)
  (org-sort-entries nil ?o)
  )

(with-eval-after-load 'org
(org-babel-do-load-languages 'org-babel-load-languages '((ruby . t)
(shell . t)
)))

(provide 'init-org-mode)
