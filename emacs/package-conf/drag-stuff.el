;;; drag-stuff.el --- Configurazione package `drag-stuff'

;;; Commentary:
;; Configurazione package `drag-stuff', che permette di
;; poter spostare il testo su e giu con le combinazioni
;; di tasti M-↑ e M-↓

;;; Code:

;;=# Drag-stuff
(use-package drag-stuff
  :ensure t
  :config
  (global-set-key (kbd "M-<up>")   #'drag-stuff-up)
  (global-set-key (kbd "M-<down>") #'drag-stuff-down)
  (global-set-key (kbd "M-p")   #'drag-stuff-up)
  (global-set-key (kbd "M-n") #'drag-stuff-down)
  )


;;; drag-stuff.el ends here.
