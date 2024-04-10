;;; eshell.el --- Configurazione della shell integrata `eshell'

;;; Commentary:
;;; Configurazione di base della shell integrata a Emacs `eshell'
;;; L'obiettivo è quella di renderla una shell utilizzabile, customizzandola

;;; Code:

(setq eshell-history-file-name nil)

(setq eshell-prompt-function
      (lambda()
        (concat (getenv "USER") "@" (getenv "HOST") ":"
                ((lambda (p-lst)
                   (if (> (length p-lst) 3)
                       (concat
                        (mapconcat (lambda (elm) (substring elm 0 1))
                                   (butlast p-lst (- (length p-lst) 3))
                                   "/")
                        "/"
                        (mapconcat (lambda (elm) elm)
                                   (last p-lst (- (length p-lst) 3))
                                   "/"))
                     (mapconcat (lambda (elm) elm)
                                p-lst
                                "/")))
                 (split-string (eshell/pwd) "/"))
                (if (= (user-uid) 0) " # " " 𝛌 "))))

(setq eshell-prompt-regexp "^[^𝛌]+ 𝛌 ")

(setq 3le/eshell-aliases
      '((cls  . eshell/clear-scrollback)
        (open . find-file)
        (ll   . (lambda () (eshell/ls '-la)))))

(mapc (lambda (alias)
        (defalias (car alias) (cdr alias)))
      3le/eshell-aliases)

;;; eshell.el ends here.
