;; company.el --- Configurazione package `company'

;;; Commentary:
;; Configurazione del package `company', utile per
;; l'autocompletamento durante la scrittura di codice


;;; Code:

;;=# Company
(use-package company

  :config
  ;; (add-hook 'foo-mode-hook 'eglot-ensure)
  (add-hook 'after-init-hook 'global-company-mode)
  ;; (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'sh-mode-hook #'(lambda () (company-mode -1)))
  (add-hook 'eshell-mode-hook  #'(lambda () (company-mode -1)))
  )

;;; company.el ends here.
