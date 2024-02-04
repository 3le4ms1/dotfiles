;;; buffer-move.el --- Configurazione del package `buffer-move'

;;; Summary:
;; Configurazione del package `buffer-move', che permette di
;; spostare i buffer in un frame

;;; Code:

;;=# Buffer Move
(require 'buffer-move)
(global-set-key (kbd "<C-M-up>")    'buf-move-up)
(global-set-key (kbd "<C-M-down>")  'buf-move-down)
(global-set-key (kbd "<C-M-left>")  'buf-move-left)
(global-set-key (kbd "<C-M-right>") 'buf-move-right)

;;; buffer-move.el ends here.
