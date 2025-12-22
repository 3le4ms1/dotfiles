;;; theme.el --- Configurazione del tama

;;; Commentary:
;; File di configurazione del tema.  Permette il download automatico del tema e
;; l'avvio automatico

;;; Code:
;; Themes auto install
(use-package abyss-theme
  :ensure t)

(use-package gruber-darker-theme
  :ensure t)

(use-package modus-themes
  :ensure t)

(use-package ef-themes
  :ensure t)

(use-package ef-themes
  :ensure t)

(load-theme 'ef-bio t t)
;;; theme.el ends here.
