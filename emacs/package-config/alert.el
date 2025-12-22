;;; alert.el --- Simple configuration for the `alert' package

;;; Commentary: Simple configuration with a simple custom alert style that
;;; roughly works natively on Windows.  This is used by other packages to launch
;;; notification to the user.

;;; Code:
(use-package alert
  :ensure t
  :config
  ;; Custom alert style that roughly works on windows
  (alert-define-style '3le4ms1/winotifier :title "windows compatible simple style"
                      :notifier
                      (lambda (info)
                        (w32-notification-close 42)
                        (w32-notification-notify
                         :title (plist-get info :message)
                         :body  (plist-get info :title)
                         :icon nil
                         :level 'info)
                        ;; ;; The message text is :message
                        ;; (plist-get info :message)
                        ;; ;; The :title of the alert
                        ;; (plist-get info :title)
                        ;; ;; The :category of the alert
                        ;; (plist-get info :category)
                        ;; ;; The major-mode this alert relates to
                        ;; (plist-get info :mode)
                        ;; ;; The buffer the alert relates to
                        ;; (plist-get info :buffer)
                        ;; ;; Severity of the alert.  It is one of:
                        ;; ;;   `urgent'
                        ;; ;;   `high'
                        ;; ;;   `moderate'
                        ;; ;;   `normal'
                        ;; ;;   `low'
                        ;; ;;   `trivial'
                        ;; (plist-get info :severity)
                        ;; ;; Whether this alert should persist, or fade away
                        ;; (plist-get info :persistent)
                        ;; ;; Data which was passed to `alert'.  Can be
                        ;; ;; anything.
                        ;; (plist-get info :data)
                        )

                      ;; Removers are optional.  Their job is to remove
                      ;; the visual or auditory effect of the alert.
                      :remover
                      (lambda (info)
                        ;; It is the same property list that was passed to
                        ;; the notifier function.
                        ))

  (setq alert-default-style '3le4ms1/winotifier))

;;; alert.el ends here.
