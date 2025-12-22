;;; haskell.el --- Configurazione haskesll-mode

;;; Commentary:

;;; Code:

;; (setq haskell-process-type 'cabal-new-repl)
(setq haskell-process-type 'auto)
(setq haskell-process-log t)

(add-hook 'haskell-mode-hook 'haskell-indent-mode)
;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)

(add-hook 'haskell-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '((company-capf company-dabbrev-code))
                         company-backends))))

;;; haskell.el ends here.
