;;; _foreign.el --- Configurazione dei file in repos esterni

;;; Commentary:
;;; Configurazione dei vari repository con modes varie

;;; Code:
(mapc #'load (file-expand-wildcards "~/.config/emacs/foreign/*/*-mode.el"))

;; Simpc-mode
(add-to-list 'auto-mode-alist '("\\.c$" . simpc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . simpc-mode))

;; old-ada-mode
(cl-loop for ext in '("\\.gpr$" "\\.ada$" "\\.ads$" "\\.adb$")
              do (add-to-list 'auto-mode-alist (cons ext 'ada-mode)))

;;; _foreign.el ends here.
