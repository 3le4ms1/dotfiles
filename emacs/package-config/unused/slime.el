;;; slime.el --- `slime' configuration

;;; Summary:
;; Configuration and installation of `slime' package

;;; Code:
(use-package slime
  :ensure t
  :config
  (let ((slime-helper-file "~/quicklisp/slime-helper.el"))
    (when (file-exists-p slime-helper-file)
      (load (expand-file-name slime-helper-file))))
  (setq inferior-lisp-program "sbcl"
        inferior-lisp-mode "sbcl"))

;;; slime.el ends here.
