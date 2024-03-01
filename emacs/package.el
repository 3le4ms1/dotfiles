;;; package.el --- Configurazione dei repository dei package

;;; Commentary:
;; Configurazione generale dei vati repository da cui scaricare i packages

;;; Code:

;; =# Pacchetti da MELPA
(use-package package
  :ensure t

  :init
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("elpa"  . "http://elpa.gnu.org/packages/") t)
  ;; (add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/") t)
  ;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  )
;;; package.el ends here.
