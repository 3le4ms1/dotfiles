;;; tide.el --- Configurazione package `tide'

;;; Commentary:
;; Package che permette di avere utility come lsp e xref jump mentre si
;; programma in Typescript

;;; Code:
(use-package tide
  :ensure t
  :config
  ;; (tide-setup)
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    ;; (tide-hl-identifier-mode t)
  )

  (setq tide-format-options
        '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t
          :placeOpenBraceOnNewLineForFunctions nil))
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  )
;;; tide.el ends here.
