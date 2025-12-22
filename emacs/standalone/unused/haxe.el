;;; haxe.el --- Configurazione haxe-mode

;;; Commentary:

;;; Code:
(define-derived-mode haxe-mode js-mode "Haxe"
  "Haxe syntax highlighting mode. This is simply using js-mode for now.")
(add-to-list 'auto-mode-alist '("\\.hx$" . haxe-mode))

;;; haxe.el ends here.
