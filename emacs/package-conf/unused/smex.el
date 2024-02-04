;;; smex.el --- Configurazione `smex'

;;; Summary:
;; Configurazione package `smex', che permette uno stile simile ad ido-mode
;; per i comandi, quando si preme M-x

;;; Code:

;; =# SMEX keybinding (IDO per M-x)
;;Smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-x") 'smex)

;; Inserisce uno - quando si usa smex come in M-x
(defadvice smex (around space-inserts-hyphen activate compile)
  "Add a - when using smex."
  (let ((ido-cannot-complete-command
         `(lambda ()
            (interactive)
            (if (string= " " (this-command-keys))
                (insert ?-)
              (funcall ,ido-cannot-complete-command)))))
    ad-do-it))


;;; smex.el ends here.
