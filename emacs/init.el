;;; init.el --- Configurazione emacs di 3le4ms1

;;; Commentary:
;; Emacs configuration made by 3le4ms1

;;; Code:
(defvar 3le4ms1/emacs-conf-dir
  (directory-file-name ;; remove trailing /
   (file-name-directory ;; get directory of file
    (file-truename load-file-name)))) ;; follow symlink to get to this file

(let ((do-profile nil)
      (eval-debug-file nil))
  (when (not (null do-profile)) (profiler-start))

  (when eval-debug-file (load (concat 3le4ms1/emacs-conf-dir "/debug.el")))
  (load (concat 3le4ms1/emacs-conf-dir "/foreign/foreign.el"))
  (load (concat 3le4ms1/emacs-conf-dir "/package.el"))

  (mapc #'load (file-expand-wildcards (concat 3le4ms1/emacs-conf-dir "/local/*.el")))
  (mapc #'load (file-expand-wildcards (concat 3le4ms1/emacs-conf-dir "/config/*.el")))
  (mapc #'load (file-expand-wildcards (concat 3le4ms1/emacs-conf-dir "/standalone/*.el")))
  (mapc #'load (file-expand-wildcards (concat 3le4ms1/emacs-conf-dir "/package-config/*.el")))

  (when (not (null do-profile)) (profiler-stop)))

;;; init.el ends here.
