;;; lsp.el --- Configurazione del package `lsp-mode'

;;; Commentary:
;; Configurazione veloce del package `lsp-mode', alternativa utile al package
;; `eglot', utilizzati per l'interoperabilità con i server lsp dei vari
;; linguaggi di programmazione

;;; Code:
(setq lsp-haskell-server-path "C:\\haskell\\ghcup\\bin\\")

(setq lsp-ui-doc-show-with-cursor nil)

;; (define-key 'lsp-mode-map (kbd "C-c <SPC>") (lambda ()
                                    ;; (interactive)
                                    ;; (lsp-ui-doc-show)
                                    ;; (lsp-ui-doc-focus-frame)))

;;; lsp.el ends here.
