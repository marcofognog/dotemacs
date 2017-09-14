;;; init-helm.el --- Helm configuration
;;
;; Copyright (C) 2015 Brunno dos Santos <emacs at brunno dot me>
;;
;; Author: Brunno dos Santos @squiter
;; URL: http://github.com/squiter/emcas-fast-start
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; See <http://www.gnu.org/licenses/> for a copy of the GNU General
;; Public License.
;;
;;; Commentary:
;;

;;; Code:
(require 'rubocop)

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

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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

(provide 'init-general)
;;; init-general.el ends here

