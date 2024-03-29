(defvar fognog-toggle-fold-all nil "Current state of hideshow for toggling all blocks.")
(defvar fognog-toggle-fold-block nil "Current state of hideshow for toggling block.")

;; TODO scope the state by buffer
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

(defun prettify-xml ()
  (interactive)
  (let
      ((b (if mark-active (min (point) (mark)) (point-min)))
       (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e "xmllint --format - " (current-buffer) t))
  )


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

(defun fognog-work-notes()
  "Open work notes file"
  (interactive)
  (find-file "~/projetos/notes/demodesk.org")
  )

(defun fognog-switch-project()
  "Wrap discover-projectss with swtich-project"
  (interactive)
  (projectile-discover-projects-in-search-path)
  (projectile-switch-project)
  )

(defun fognog-autocommit-notes()
  (interactive)

  (switch-to-buffer "*Messages*")
  (shell-command "cd ~/projetos/notes/ && git commit -am 'auto update' && git push origin master")
)

(defun fognog-autopull-notes()
  (interactive)

  (switch-to-buffer "*Messages*")
  (shell-command "cd ~/projetos/notes/ && git pull origin master --rebase")
)

(defun fognog-notes-add-week()
  (interactive)

  (setq week-number (string-to-number (shell-command-to-string "date +%U")))
  (setq correct-week-number (+ week-number 2))
  (insert (format "* semana-%d
** Mon
** Tue
** Wed
** Thu
** Fri
** Sat
** Sun
" correct-week-number))
          )

(defun chmod-plus-x ()
  (interactive)
  (shell-command-to-string (concat "chmod +x " (buffer-file-name (current-buffer))))
  (revert-buffer))

(require 'subr-x)
;; Usage
;;(message "%s" (extract-path "experteer@lisbeth:/usr/experteer/www/roots/pjpp$\n"))
(defun extract-path(line)
  "Extract TRAMP path from prompt line"
  (setq one (last (split-string line "@")))
  (setq ar (split-string (pop one) "\\:"))
  (setq two (last ar))
  (setq host (pop ar))
  (setq nobreak (replace-regexp-in-string "\n" "" (pop two)))
  (setq three (replace-regexp-in-string "\\$" "" nobreak))
  (string-trim (concat "/ssh:" host ":" three))
  )

(defun update-default-directory-from-shell()
  (interactive)
  (setq line (thing-at-point 'line t))
  (setq default-directory (extract-path line))
  (message "Default directory set to %s" default-directory)
  )

(defun new-eshell()
  "Open a new instance of eshell."
  (interactive)
  (eshell 'N))

(defun new-shell ()
  "Open a new instance of shell."
  (interactive)
  (let (
        (currentbuf (get-buffer-window (current-buffer)))
        (newbuf     (generate-new-buffer-name "*shell*"))
       )

   (generate-new-buffer newbuf)
   (set-window-dedicated-p currentbuf nil)
   (set-window-buffer currentbuf newbuf)
   (shell newbuf)
  )
)

;; demodesk
(defun ssh-teshub()
  (interactive)
  (find-file "/sshx:teshub:/root/demodesk")
  )

(defun ssh-cont-demodesk()
  (interactive)
  (find-file "/sshx:teshub|docker:root@demodesk-app:/myapp")
  )

(defun open-current-file-in-demo-cont()
  (interactive)
  (setq previous-line (line-number-at-pos))
  (setq relative-file-path (last (split-string buffer-file-name "/backend")))
  (find-file (concat "/sshx:teshub|docker:root@demodesk-app:/myapp/" (car relative-file-path)))
  (goto-line previous-line)
  )

(defun open-current-file-out-demo-cont()
  (interactive)
  (setq previous-line (line-number-at-pos))
  (setq relative-file-path (last (split-string buffer-file-name "/myapp")))
  (find-file (concat "/sshx:teshub:/root/demodesk/backend/" (car relative-file-path)))
  (goto-line previous-line)
  )

(defun cont-rspec-verify-single()
  (interactive)
  (open-current-file-in-demo-cont)
  (rspec-verify-single)
  (open-current-file-out-demo-cont)
  )

(defun ssh-cont-storybook()
  (interactive)
  (find-file "/sshx:teshub|docker:root@demodesk-storybook:/usr/src/app/src")
  )

(defun ssh-cont-rubocop()
  (interactive)
  (ssh-cont-demodesk)
  (rubocop-check-project)
  )


;; rspec's output is too verbose by default in this project
(defun ssh-cont-rspec()
  (interactive)
  (ssh-cont-demodesk)
  (rspec-verify-all)
  )

(defun shell-from-dired ()
  (interactive)
  (setq saved-dir default-directory)
  (message "a %s" saved-dir)
  (shell)
  (with-current-buffer "*shell*"
    (end-of-buffer)
    (insert (concat "cd " saved-dir))
    )
  )

;; fix to the issue
;; 'netstat exited with status 1' when connection with magit to remote git repo
;; https://github.com/magit/ssh-agency/issues/19
(defun fix-ssh-netstat-exited-with-status-1()
  (interactive)
  (setq ssh-agency-socket-locaters
        (assq-delete-all 'ssh-agency-find-socket-from-netstat
                         ssh-agency-socket-locaters))
  )

(defun fix-ssh-auth-sock-env-var ()
  (interactive)
  (setq ssh_sock_location (shell-command-to-string "echo $SSH_AUTH_SOCK"))
  (message ssh_sock_location)
  (setenv "SSH_AUTH_SOCK" ssh_sock_location)
  )
(provide 'init-fognog)
