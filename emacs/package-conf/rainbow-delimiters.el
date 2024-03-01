;;; rainbow-delimiters.el --- Configurazione del package `rainbow-delimiters'

;;; Commentary:
;; Configurazione package `rainbow delimiters', che colora le parentesi
;; a due a due uguali

;;; Code:

;; =# Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

  )
;;; rainbow-delimiters.el ends here.
