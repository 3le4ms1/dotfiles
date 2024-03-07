;;; god-mode.el --- Configurazione per il package `god-mode'

;;; Commentary:

;;; Code:

(use-package god-mode
  :enable t
  :config
  (global-set-key (kbd "C-<f8>") #'(lambda ()
                                     (interactive)
                                     (message "Switch god-mode")
                                     (god-mode-all)))

  )
;;; god-mode.el ends here.
