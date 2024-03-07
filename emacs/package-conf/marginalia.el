;;; marginalia.el --- Configurazione package `marginalia'

;;; Commentary:
;; `marginalia' lavora con `vertigo' e aggiunge la descrizione dei comandi al
;; lato, quando di preme `M-x' per eseguire un comando

;;; Code:
;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :ensure t
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.

  ;; The :config section is executed only if the package is installed
  :config

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode)
  )
;;; marginalia.el ends here.
