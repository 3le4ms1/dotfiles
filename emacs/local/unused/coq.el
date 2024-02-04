;;; coq.el --- Configurazione per programmare in coq

;;; Commentary:
;; configurazione di tutti i package per poter programmare in coq


;;; Code:

(custom-set-variables '(coq-prog-name "C:\\ProgramData\\scoop\\shims\\coqtop.exe") '(proof-three-window-enable t))

;; Load company-coq when opening Coq files
(add-hook 'coq-mode-hook #'company-coq-mode)

;;; coq.el ends here.
