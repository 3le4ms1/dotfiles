;;; windmove.el --- Configurazione package `windmove'

;;; Commentary:
;; Configurazione package `windmove', che permette di spostarsi
;; tra i buffer in un frame

;;; Code:

;;=# WindMove
(use-package windmove

  :config
  (global-set-key (kbd "C-c <left>")  'windmove-left)
  (global-set-key (kbd "C-c <right>") 'windmove-right)
  (global-set-key (kbd "C-c <up>")    'windmove-up)
  (global-set-key (kbd "C-c <down>")  'windmove-down)

  (global-set-key (kbd "C-c b") 'windmove-left)
  (global-set-key (kbd "C-c f") 'windmove-right)
  (global-set-key (kbd "C-c p") 'windmove-up)
  (global-set-key (kbd "C-c n") 'windmove-down)
)
;;; windmove.el ends here.
