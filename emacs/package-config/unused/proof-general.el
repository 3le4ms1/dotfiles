;;; proofgeneral.el --- Configurazione package `proof-general'
;;; Commentary:
;; Configurazione del package `proof-general', usato per interfacciarsi a
;; diversi proof assistants, come `coq'

;;; Code:
(use-package proof-general
  :ensure t
  :config
  (setq coq-use-project-file nil)
  )
;;; proofgeneral.el ends here.
