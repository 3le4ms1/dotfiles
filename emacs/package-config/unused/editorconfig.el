;;; editorconfig.el --- Configurazione package `editorconfig'

;;; Commentary:
;; Configurazione di base del package `editorcondig'.  Trovata sulla pagina
;; github del package [[https://github.com/editorconfig/editorconfig-emacs#readme]]

;;; Code:
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1)
  (setq editorconfig-trim-whitespaces-mode
        #'delete-trailing-whitespace))

;;; editorconfig.el ends here.
