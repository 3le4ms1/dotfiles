;;; orderless.el --- Configurazione del package `orderless'

;;; Commentary:

;;; Code:

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((file (styles basic partial-completion))))
  )
;;; orderless.el ends here.
