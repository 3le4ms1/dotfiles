;;; whitespace.el --- Configurazione whitespace mode

;;; Commentary:
;; Configurazione per `whitespace.el', per gestione rapida della visualizzazione
;; di tabs, spaces, trailing spaces, ...

;; Devo ancora capire come gestire i colori per bene, ma quello è più facile da
;; fare con `customize-group whitespace'

;;; Code:
;;=# whitespace
(require 'whitespace)
(global-whitespace-mode t)

;; '(whitespace-style '(face trailing tabs spaces indentation::tab
;;                      indentation::space indentation space-mark tab-mark))

;; `C-h v whitespace-style RET'
(setq whitespace-style '(face trailing))

;;; whitespace.el ends here.
