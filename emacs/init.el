;;; init.el --- Configurazione emacs di 3le4ms1

;;; Commentary:
;; Emacs configuration made by 3le4ms1

;;; Code:

;;=# File loading
(defvar 3le4ms1/emacs-conf-dir (concat (getenv "XDG_CONFIG_HOME") "/emacs"))

;; (load (concat 3le4ms1/emacs-conf-dir "/debug.el"))
(load (concat 3le4ms1/emacs-conf-dir "/foreign/foreign.el"))
(load (concat 3le4ms1/emacs-conf-dir "/package.el"))

(mapc #'load (file-expand-wildcards (concat 3le4ms1/emacs-conf-dir "/local/*.el")))
(mapc #'load (file-expand-wildcards (concat 3le4ms1/emacs-conf-dir "/config/*.el")))
(mapc #'load (file-expand-wildcards (concat 3le4ms1/emacs-conf-dir "/standalone/*.el")))
(mapc #'load (file-expand-wildcards (concat 3le4ms1/emacs-conf-dir "/package-conf/*.el")))

;; =# Parte auto gestita da Emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-extra-options " -shell-escape ")
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
 '(describe-char-unidata-list '(name old-name general-category decomposition))
 '(frame-brackground-mode 'dark)
 '(global-whitespace-mode t)
 '(inhibit-startup-screen t)
 '(keyboard-coding-system 'utf-8-dos)
 '(package-selected-packages
   '(julia-mode company-coq proof-general tmux-mode cider babashka clojure-mode zig-mode ox-epub ox-gemini treemacs uwu-theme lsp-mode compat geiser-racket geiser-guile geiser php-mode erlang racket-mode crux web-mode yaml-mode chip8 kanagawa-theme ink-mode dot-env nordic-night-theme company-box projectile typescript-mode cmake-mode lorem-ipsum fireplace orderless free-keys license-templates dash powershell consult marginalia vertico ripgrep lsp-ui lsp-haskell eglot haskell-mode hindent sly gnuplot htmlize flycheck-rust lua-mode restart-emacs toml-mode rust-mode company-auctex math-symbol-lists ascii-table emmet-mode which-key gnuplot-mode auto-complete-c-headers company-c-headers ahk-mode rainbow-delimiters magit bash-completion company gdscript-mode toc-org org-bullets org-appear org-super-agenda flycheck drag-stuff zoom use-package buffer-move markdown-mode multiple-cursors gruber-darker-theme))
 '(select-enable-clipboard t)
 '(show-trailing-whitespace nil)
 '(warning-suppress-log-types '((comp)))
 '(warning-suppress-types '((comp)))
 '(whitespace-style
   '(face trailing tabs spaces indentation::tab indentation::space indentation space-mark tab-mark))
 '(zoom-mode t nil (zoom))
 '(zoom-size '(0.618 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-indentation ((t (:background "#181818" :foreground "#453d41"))))
 '(whitespace-space-after-tab ((t (:foreground "#ffdd33"))))
 '(whitespace-tab ((t (:background "#181818" :foreground "#282828")))))

;;; init.el ends here.
