;;; powerline.el --- Configurazione package `powerline'

;;; Commentary:
;; Configurazione del package `powerline', che lavora insieme a evil
;; per permettere la visualizzazione delle informazioni necessarie
;; sulla barra di stato, anche nella modalità con le keybindings
;; di Vim

;;; Code:

;;=# Powerline-evil
(use-package powerline-evil
  :ensure t
  :config
  (powerline-evil-vim-color-theme)
  )
;;; powerline.el ends here.
