;;; orderless.el --- Configurazione del package `orderless'

;;; Summary:


;;; Code:

(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))
;;; orderless.el ends here.
