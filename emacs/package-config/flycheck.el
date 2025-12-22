;;; flycheck.el --- Configurazione `flycheck'

;;; Commentary:
;; Configurazione del package `flycheck', responsabile della visualizzazione di
;; errori e warning nel codice

;;; Code:

;; =# Flycheck
(use-package flycheck
  :ensure t
  :config
  ;; (global-flycheck-mode)
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  (with-eval-after-load 'c-moden
    (add-hook 'c-mode-hook
              (lambda () (flycheck-select-checker 'c/c++-gcc))))
  ;; simpc-mode for c by tsoding
  ;; TODO: `simpc-mode' major mode unsupported by flycheck
  ;; (with-eval-after-load 'simpc-mode
  ;;   (add-hook 'simpc-mode-hook
  ;;             (lambda () (flycheck-select-checker 'c/c++-gcc))))
  (with-eval-after-load 'c++-mode
    (add-hook 'c++-mode-hook
              (lambda () (flycheck-select-checker 'c/c++-gcc)))))

;;; flycheck.el ends here.
