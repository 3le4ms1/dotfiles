;;; _foreign.el --- Configurazione dei file in repos esterni

;;; Commentary:
;;; Configurazione dei vari repository con packages vari.
;;; I vari packages esterni sono contenuti nella variabile `foreign-packages',
;;; secondo il seguente formato:
;;; `(package-name package-init-file.el package-repo-link)'
;;; La funzione `3le4ms1/foreign-package-manager' prende tutta la lista che descrive
;;; un package (quella sopra), e fa il controllo per vedere se è già scaricata.
;;; Se non è presente, la scarica, e la carica

;;; Code:

(defvar 3le4ms1/foreign-packages '(
                                   ("fasm-mode"    "fasm-mode.el"  "https://github.com/the-little-language-designer/fasm-mode.git")
                                   ("simpc-mode"   "simpc-mode.el" "https://github.com/rexim/simpc-mode.git")
                                   ("old-ada-mode" "ada-mode.el"   "https://github.com/tkurtbond/old-ada-mode.git")
                                   ))

(defun 3le4ms1/foreign-package-manager (package)
  "Automatic download and load of PACKAGE."
  (progn
    ;; (unless cond) == (if (not (cond)))
    ;; check per la directory del package
    (unless (file-exists-p (concat 3le4ms1/emacs-conf-dir "/foreign/" (car package)))
      (shell-command (concat "git clone --depth=1 " (car (cdr (cdr package))) " "
                             3le4ms1/emacs-conf-dir "/foreign/repos/" (car package))))
    (load (concat 3le4ms1/emacs-conf-dir "/foreign/repos/"
                  (car package) "/" (car (cdr package))))))

(mapc #'3le4ms1/foreign-package-manager 3le4ms1/foreign-packages)

;; fasm-mode
;; https://github.com/the-little-language-designer/fasm-mode.git

;; simpc-mode
;; https://github.com/rexim/simpc-mode.git
(add-to-list 'auto-mode-alist '("\\.c$" . simpc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . simpc-mode))

(add-hook 'simpc-mode-hook (lambda ()
                             (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

;; old-ada-mode
;; https://github.com/tkurtbond/old-ada-mode.git
(cl-loop for ext in '("\\.gpr$" "\\.ada$" "\\.ads$" "\\.adb$")
         do (add-to-list 'auto-mode-alist (cons ext 'ada-mode)))

;;; foreign.el ends here.
