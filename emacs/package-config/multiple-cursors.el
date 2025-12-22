;;; multiple-cursors.el --- Configurazione package `multiple-cursors'

;;; Commentary:
;; Configurazione package `multiple-cursors', che permette di editare
;; il testo con più cursori contemporaneamente

;; https://emacs.stackexchange.com/questions/51777/why-cant-multiple-cursors-type-in-org-mode-files

;;; Code:

;; =# Multiple Cursors
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->")         'mc/mark-next-like-this)
  (global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
  ;; (global-set-key (kbd "C-.")         'mc/skip-to-next-like-this)
  ;; (global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
  )

;;; multiple-cursors.el ends here.
