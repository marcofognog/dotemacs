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

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa."
  (interactive)
  (let* ((this (selected-window))
         (other (next-window))
         (this-buffer (window-buffer this))
         (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)))

(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line."
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))

(defun fognog-create-project()
  "Creates a new project in the projects folder"
  (interactive)
   (setq new-project (read-string "New project's name: "))
   (setq command (concat "mkdir ~/projetos/" new-project " && cd ~/projetos/" new-project " && git init ."))
   (async-shell-command command)
   (projectile-discover-projects-in-directory "~/projetos/")
  )

(defun fognog-go-to-downloads-dired()
  "Go to Downloads folder with dired"
  (interactive)
  (dired "~/Downloads")
  )

(defun fognog-go-to-home-dired()
  "Go to home with dired"
  (interactive)
  (dired "~/")
  )

(defun replace-in-string (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

(defun fognog-uncompress()
  "Uncompress file at point in dired"
  (interactive)
  (setq compressed-filename (replace-in-string "\s" "\\ " (dired-get-filename)))
  (setq command (concat "cd " dired-directory "; ~/.scripts/uncompress.sh " compressed-filename ))
  (async-shell-command command)
  (revert-buffer)
  )

(defun fognog-notes()
  "Open notes file"
  (interactive)
  (find-file "~/projetos/notes/notes.org")
  )

(defun fognog-switch-project()
  "Wrap discover-projectss with swtich-project"
  (interactive)
  (projectile-discover-projects-in-search-path)
  (projectile-switch-project)
  )
(provide 'init-fognog)
