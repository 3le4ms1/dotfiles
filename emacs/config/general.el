;; general --- Configurazione generale

;;; Commentary:
;; Configurazione delle impostazioni generali di Emacs

;;; Code:

;; =# server
;; (load "server")
;; (unless (server-running-p) (server-start))

;; =# general
;; (ido-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;; (speedbar 1)
;; (tab-bar-mode 1)
(global-prettify-symbols-mode +1)
(global-auto-revert-mode t)

(electric-pair-mode 1)
(show-paren-mode 1)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; (setq display-line-numbers-type 'relative)

;; (display-time-mode 1)

;;=# add-hook
;; (add-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'prog-mode-hook #'auto-fill-mode)
(add-hook 'org-mode-hook #'auto-fill-mode)

;;=# set
(if (daemonp)
    (progn
      (cd (getenv "HOME"))
      (setq default-directory (getenv "HOME"))
      (setq command-line-default-directory (getenv "HOME"))))

(setenv "USER" "3le4ms1")
(setenv "HOST" "msi")
(setenv "LANG" "it_IT,en_US")
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq column-number-mode t)
(setq ring-bell-function 'ignore)
(setq-default doc-view-continuous 1)

(setq package-gnupghome-dir "~/.emacs.d/elpa/gnupg/")

(setq-default indent-tabs-mode nil)
(setq-default default-tab-width 2)
(setq-default tab-width 2)
(setq-default foundamental-tab)

(setq make-backup-files nil)

(setq-default fill-column 80)
;; (global-display-fill-column-indicator-mode)

(setq display-time-format "%H:%M")

;; (setq backup-directory-alist '((".*" . "~/.Trash")))

;;=# put
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;;=# whitespace
(require 'whitespace)
(global-whitespace-mode t)

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;;=# kill buffer
(defvar bury-buffer-names '("*scratch*" "*dashboard*" "*Messages*" "**lose**"))

(defun kill-buffer-query-functions-maybe-bury ()
  "Bury certain buffers instead of killing them."
  (if (member (buffer-name (current-buffer)) bury-buffer-names)
      (progn
        (kill-region (point-min) (point-max))
        (bury-buffer)
        nil)
    t))

(add-hook 'kill-buffer-query-functions 'kill-buffer-query-functions-maybe-bury)

;;=# dired
(add-hook 'dired-mode-hook
          (lambda ()
            "Move up a directory."
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file ".."))))
          )

(eval-after-load "dired" '(progn
                            (define-key dired-mode-map (kbd "*") 'dired-create-empty-file)))

;;=# indent
(define-key global-map (kbd "RET") 'newline-and-indent)
(add-hook 'f90-mode-hook (lambda ()
                           (local-set-key (kbd "RET")
                                          'reindent-then-newline-and-indent)))
(add-hook 'c-mode-hook (lambda ()
                           (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

;;; general.el ends here.
