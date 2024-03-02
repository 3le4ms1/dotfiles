;;; buffer-move.el --- Configurazione del package `buffer-move'

;;; Commentary:
;; Configurazione del package `buffer-move', che permette di
;; spostare i buffer in un frame

;;; Code:

;;=# Buffer Move
(use-package buffer-move

  :config
  (global-set-key (kbd "<C-M-up>")    'buf-move-up)
  (global-set-key (kbd "<C-M-down>")  'buf-move-down)
  (global-set-key (kbd "<C-M-left>")  'buf-move-left)
  (global-set-key (kbd "<C-M-right>") 'buf-move-right)
  )

;;; buffer-move.el ends here.
