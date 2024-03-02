;;; flycheck.el --- Configurazione `flycheck'

;;; Commentary:
;; Configurazione del package `flycheck', responsabile della visualizzazione di
;; errori e warning nel codice

;;; Code:

;; =# Flycheck
(use-package flycheck

  :config
  (global-flycheck-mode)
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  (add-hook 'c++-mode-hook
            '(flycheck-select-checker 'c/c++-gcc))
  )

;;; flycheck.el ends here.
