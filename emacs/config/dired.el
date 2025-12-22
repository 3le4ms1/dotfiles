;;; dired.el --- Configurazione di `dired'

;;; Commentary:
;; Configurazione base di `dired-mode', il file manager di emacs

;;; Code:

(require 'dired-x)
(put 'dired-find-alternate-file 'disabled nil)

(setq dired-listing-switches "-lah")
(setq-default dired-dwim-target t)
(setq dired-mouse-drag-files t)

(add-hook 'dired-mode-hook
          (lambda ()
            "Move up a directory."
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))))

(eval-after-load "dired" '(progn
                            (define-key dired-mode-map (kbd "[") #'dired-create-empty-file)))
(eval-after-load "dired" '(progn
                            (define-key dired-mode-map (kbd "]") #'make-directory)))

;;; dired.el ends here.
