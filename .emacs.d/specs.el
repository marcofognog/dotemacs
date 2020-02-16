(require 'ert)

;; run with
;; emacs -batch  -f toggle-debug-on-error -l ert -l .emacs.d/specs.el -f ert-run-tests-batch-and-exit

(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))

(require 'init-toggle-truth)

(ert-deftest turns-true-into-false-only-in-the-line-at-point ()
  (setq initial-ruby-code "config.x.kafka.enabled = true\nconfig.x.kafka.enabled = true")
  (setq expected-ruby-code "config.x.kafka.enabled = false\nconfig.x.kafka.enabled = true")

  (get-buffer-create "sample")
  (set-buffer "sample")

  (with-current-buffer "sample"
    (goto-char (point-max))
    (insert initial-ruby-code)
    )

  (goto-line 1)
  ;; exercise
  (toggle-truth)

  (should (string= (buffer-string) expected-ruby-code))
  )

