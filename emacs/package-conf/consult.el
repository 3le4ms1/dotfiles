;;; consult.el --- Configurazione package `consult'

;;; Commentary:
;; configurazione del package di ricerca `consult', che lavora insieme a
;; `vertigo'

;;; Code:
(use-package consult
  :ensure t
  ;; (require 'vertico)
  (package-initialize)
  (vertico-mode)
  (setq completion-styles '(substring basic))
  )

;; (global-set-key (kbd "C-s") 'consult-ripgrep)

;;; consult.el ends here.
