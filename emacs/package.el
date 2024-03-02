;;; package.el --- Configurazione dei repository dei package

;;; Commentary:
;; Configurazione generale dei vati repository da cui scaricare i packages

;;; Code:

;; =# Pacchetti da MELPA

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa"  . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; (package-install-selected-packages)

;;; package.el ends here.
