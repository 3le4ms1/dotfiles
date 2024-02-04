;;; simpleclip.el --- Configurazione package `simpleclip'

;;; Commentary:
;; Configurazione del package `simpleclip', che permette di interagire
;; con la clip di sistema

;; =# Simpleclip

(require 'simpleclip)
(simpleclip-mode 1)

(global-set-key (kbd "C-w") 'simpleclip-cut)
(global-set-key (kbd "M-w") 'simpleclip-copy)
(global-set-key (kbd "C-y") 'simpleclip-paste)

;;; simpleclip.el ends here.
