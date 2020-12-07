(require 'rubocop)

;; Fix error "dead-acute is undefined": accents were not displaying
(require 'iso-transl)

(setq
  ;; disable backup files
  make-backup-files nil
  auto-save-default nil
  backup-inhibited t
  ;; If a frame alredy opened, use it!
  display-buffer-reuse-frames t
  )

;; replace marked text when type
(delete-selection-mode 1)

;; move cursor by camelCase
(subword-mode 1)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; make indentation commands use space only
(setq-default indent-tabs-mode nil)

;; whitespace display
(global-whitespace-mode)
(setq whitespace-global-modes
      '(not magit-mode git-commit-mode))
(setq whitespace-style '(face trailing tabs))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-c b")
       (lambda () (interactive) (async-shell-command "bundle install" "**Bundler**")))))
(setq ruby-indent-level 2)

;; Set the color of current line highlighting
(set-face-background 'hl-line "#3e4446")
;; keep syntax highlighting
(set-face-foreground 'highlight nil)
;; invert the color of the background
(set-face-inverse-video 'highlight t)

(set-face-attribute 'helm-selection nil
                    :background "purple"
                    :foreground "black")
(setq-default fill-column 80)

;; no delay
(setq echo-keystrokes 0.01)

;; treat words with underscores as one word
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

;; set scrolling to vim like and stop doing wierd jumps
(setq scroll-step 1)
(setq scroll-margin 10)

(add-hook 'prog-mode-hook 'turn-on-fci-mode)
(add-hook 'text-mode-hook 'turn-on-fci-mode)

(setq js-indent-level 2)

(add-hook 'after-save-hook 'evil-force-normal-state)

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
                 `(ruby-mode
                   ,(rx (or "def" "it" "describe" "context" "{" "[")) ; Block start
                   ,(rx (or "}" "]" "end"))                  ; Block end
                   ,(rx (or "#" "=begin"))                   ; Comment start
                   ruby-forward-sexp nil)))

(add-hook 'ruby-mode-hook 'hs-minor-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(setq ruby-insert-encoding-magic-comment nil)

(require 'nav-line)
(navline-mode)

(eval-after-load "dired-aux"
   '(add-to-list 'dired-compress-file-suffixes
                 '("\\.zip\\'" ".zip" "unzip")))

(defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

(server-start)

(provide 'init-general)
;;; init-general.el ends here

