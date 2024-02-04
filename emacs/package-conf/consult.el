;;; consult.el --- Configurazione package `consult'

;;; Commentary:
;; configurazione del package di ricerca `consult', che lavora insieme a
;; `vertigo'

;;; Code:
(package-initialize)
(require 'consult)
(require 'vertico)
(vertico-mode)
(setq completion-styles '(substring basic))

;; (global-set-key (kbd "C-s") 'consult-ripgrep)

;;; consult.el ends here.
