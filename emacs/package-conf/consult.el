;;; consult.el --- Configurazione package `consult'

;;; Commentary:
;; configurazione del package di ricerca `consult', che lavora insieme a
;; `vertigo'

;;; Code:
(use-package consult
  :ensure t

  :init
  (setq completion-styles '(substring basic))
  (global-set-key (kbd "C-S-s") 'consult-ripgrep)
  )

;;; consult.el ends here.
