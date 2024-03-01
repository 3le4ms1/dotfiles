;;; eglot.el --- Configurazione package `eglot'

;;; Commentary:
;; Configurazione package `eglot', fondamentale per interfacciarsi
;; ai server LPS (Language Server Provider), che permettono
;; funzioni di autocompletamento e controllo del codice

;;; Code:

(use-package eglot
  :ensure t
  ;; (define-key eglot-mode-map (kbd "C-c <tab>") #'company-complete)
  (define-key eglot-mode-map (kbd "<f2>")    #'eldoc-doc-buffer)
  (define-key eglot-mode-map (kbd "C-c e f n") #'flymake-goto-next-error)
  (define-key eglot-mode-map (kbd "C-c e f p") #'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "C-c e r")   #'eglot-rename)

  ;; (add-hook 'rust-mode-hook  'eglot-ensure)
  ;; (add-hook 'c-mode-hook 'eglot-ensure)
  ;; (add-hook 'c++-mode-hook 'eglot-ensure)

  (add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd")))

  ;; (add-to-list 'eglot-server-programs '((c-mode) . ("clangd" "-resource-dir C:\\msys64\\mingw64\\include")))


  ;; (add-hook 'latex-mode-hook 'eglot-ensure)

  )
;;; eglot.el ends here.
