(defun nav-line (number)
  (progn
    (setq number-of-slices 10)
    (setq total (- (line-end-position) (line-beginning-position)))
    (setq slice-size (/ total number-of-slices))
    (setq new-pos (+ (line-beginning-position) (* slice-size number)))
    (goto-char new-pos)
    )
  )

(defun nav-line-1 () (interactive) (nav-line 1))
(defun nav-line-2 () (interactive) (nav-line 2))
(defun nav-line-3 () (interactive) (nav-line 3))
(defun nav-line-4 () (interactive) (nav-line 4))
(defun nav-line-5 () (interactive) (nav-line 5))
(defun nav-line-6 () (interactive) (nav-line 6))
(defun nav-line-7 () (interactive) (nav-line 7))
(defun nav-line-8 () (interactive) (nav-line 8))
(defun nav-line-9 () (interactive) (nav-line 9))

(defun nav-file (number)
  (progn
    (setq number-of-slices 10)
    (setq slice-size (/ (count-lines (point-min) (point-max)) number-of-slices))
    (setq new-line-pos (* slice-size number))
    (goto-line new-line-pos)
    )
  )


(defun nav-file-1 () (interactive) (nav-file 1))
(defun nav-file-2 () (interactive) (nav-file 2))
(defun nav-file-3 () (interactive) (nav-file 3))
(defun nav-file-4 () (interactive) (nav-file 4))
(defun nav-file-5 () (interactive) (nav-file 5))
(defun nav-file-6 () (interactive) (nav-file 6))
(defun nav-file-7 () (interactive) (nav-file 7))
(defun nav-file-8 () (interactive) (nav-file 8))
(defun nav-file-9 () (interactive) (nav-file 9))

(define-minor-mode navline-mode
  "Line navegation by numbering the portion you want to go."
  :lighter "navline"
  :global t
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "M-1") 'nav-line-1)
            (define-key map (kbd "M-2") 'nav-line-2)
            (define-key map (kbd "M-3") 'nav-line-3)
            (define-key map (kbd "M-4") 'nav-line-4)
            (define-key map (kbd "M-5") 'nav-line-5)
            (define-key map (kbd "M-6") 'nav-line-6)
            (define-key map (kbd "M-7") 'nav-line-7)
            (define-key map (kbd "M-8") 'nav-line-8)
            (define-key map (kbd "M-9") 'nav-line-9)
            (define-key map (kbd "M-0") 'end-of-line)
            map))

(provide 'nav-line)
