;;; debug.el --- File di debug

;;; Commentary:
;;; File di debug, fatto girare ogni volta che `emacs' parte

;;; Code:


;; Sistema i problemi legati alle signature gpg
(setq package-check-signature nil)
(package-install 'gnu-elpa-keyring-update)
(setq package-check-signature 'allow-unsigned)

;;; debug.el ends here.
