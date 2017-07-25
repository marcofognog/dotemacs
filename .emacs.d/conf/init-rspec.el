(require 'rvm)
(require 'rspec-mode)

(setq rspec-use-rvm t)

(defadvice rspec-compile (around rspec-compile-around)
             "Use BASH shell for running the specs because of ZSH issues."
               (let ((shell-file-name "/bin/bash"))
                     ad-do-it))

(setq-default fill-column 80)
(add-hook 'ruby-mode-hook 'fci-mode)
(add-hook 'ruby-mode-hook
                    (lambda () (rvm-activate-corresponding-ruby)))

(ad-activate 'rspec-compile)

(provide 'init-rspec)
