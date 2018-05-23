(autoload 'notmuch "notmuch" "notmuch mail" t)
(require 'popwin)
(require 'notmuch)

(setq mail-user-agent 'message-user-agent)
(setq user-mail-address "marcofognog@gmail.com"
      user-full-name "Marco A. F. Nogueira")

(setq smtpmail-smtp-server "smtp.gmail.com"
      message-send-mail-function 'message-smtpmail-send-it)

(setq smtpmail-debug-info t)

(setq message-default-mail-headers "Cc: \nBcc: \n")
(setq message-auto-save-directory "~/mail/draft")
(setq message-kill-buffer-on-exit t)
(setq message-directory "~/mail/")

(setq mail-user-agent 'message-user-agent)

(setq smtpmail-stream-type 'ssl
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 465)

(defun display-unread-mail ()
  "open undread emails with notmuch"
  (interactive)
  (notmuch-search "tag:unread" nil)
  )

(defun notmuch-exec-offlineimap ()
    "execute offlineimap"
    (interactive)
    (set-process-sentinel
     (start-process-shell-command "offlineimap"
                                  "*offlineimap*"
                                  "offlineimap -o")
     '(lambda (process event)
        (notmuch-refresh-all-buffers)
        (let ((w (get-buffer-window "*offlineimap*")))
          (when w
            (with-selected-window w (recenter (window-end)))))))
    (popwin:display-buffer "*offlineimap*"))

(add-to-list 'popwin:special-display-config
             '("*offlineimap*" :dedicated t :position bottom :stick t
               :height 0.4 :noselect t))

 (provide 'init-mail)
