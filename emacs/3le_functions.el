;;; package --- Funzioni custom

;;; Commentary:
;; Funzioni custom per usare Emacs al meglio

;;; Code:

;;=# slime
;; (defun 3le/lslime ()
  ;; "Carica l'ambiente slime per Lisp."
  ;; (interactive)
  ;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; (setq inferior-lisp-program "sbcl")
  ;; (setq inferior-lisp-mode "sbcl")
  ;; (slime))

;;=# Shell Commands
(defun 3le/open-alacritty-here ()
  "Opens Alacritty in working directory."
  (interactive)
  (message "Opening Alacritty in current directory")
  (call-process-shell-command "alacritty --working-directory . &" nil 0))

(global-set-key (kbd "C-x a") '3le/open-alacritty-here)

(defun 3le/org-browse-link ()
  "Opens the link under the cursor in the browser."
  (interactive)
  (eww-browse-with-external-browser (save-match-data
                                      (when (thing-at-point-looking-at org-link-bracket-re)
                                        (match-string-no-properties 1)))))

;; (defun 3le/consult-ripgrep-single-file ()
;;     "Call `consult-ripgrep' for the current buffer (a single file)."
;;     (interactive)
;;     (let ((consult-project-function (lambda (x) nil))
;;           (consult-ripgrep-args
;;            (concat "rg "
;;                    "--null "
;;                    "--line-buffered "
;;                    "--color=never "
;;                    "--line-number "
;;                    "--smart-case "
;;                    "--no-heading "
;;                    "--max-columns=1000 "
;;                    "--max-columns-preview "
;;                    "--with-filename "
;;                    (shell-quote-argument buffer-file-name)
;;                    )))
;;       (consult-ripgrep)))

;; (global-set-key (kbd "C-s") '3le/consult-ripgrep-single-file)

(defun 3le/package-unavailable-packages ()
  "Return all the packages that are not available."
  (interactive)
  (let* ((not-installed (seq-remove #'package-installed-p package-selected-packages))
         (unavailable (seq-filter (lambda (p) (not (assq p package-archive-contents)))
                                  not-installed)))
    unavailable))


;; =# Reload della configurazione
(defun 3le/lconf ()
  "Load the .emacs file."
  (interactive)
  (load "~/.emacs")
  (message "Configuration loaded successfully"))

;;; 3le_functions.el ends here.
