;;; lsp.el --- Configurazione del package `lsp-mode'

;;; Commentary:
;; Configurazione veloce del package `lsp-mode', alternativa utile al package
;; `eglot', utilizzati per l'interoperabilità con i server lsp dei vari
;; linguaggi di programmazione

;;; Code:
(use-package lsp-mode

  :config
  ;; (setq lsp-keymap-prefix "C-c l")
  (setq lsp-ui-doc-show-with-cursor nil)
  (when (eq system-type 'windows-nt)
      (setq lsp-haskell-server-path "C:\\haskell\\ghcup\\bin\\"))
  (define-key lsp-mode-map (kbd "<f2>") (lambda ()
                                          (interactive)
                                          (lsp-ui-doc-show)
                                          (lsp-ui-doc-focus-frame)))
  )

;;; lsp.el ends here.
