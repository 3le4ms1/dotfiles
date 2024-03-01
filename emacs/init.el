;;; init.el --- Configurazione emacs di 3le

;;; Commentary:
;; Emacs configuration made by 3le

;;; Code:

;; =# Parte auto gestita da Emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-extra-options " -shell-escape ")
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" "9685cefcb4efd32520b899a34925c476e7920725c8d1f660e7336f37d6d95764" "0d0936adf23bba16569c73876991168d0aed969d1e095c3f68d61f87dd7bab9a" "bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" "6adeb971e4d5fe32bee0d5b1302bc0dfd70d4b42bad61e1c346599a6dc9569b5" default))
 '(describe-char-unidata-list '(name old-name general-category decomposition))
 '(frame-brackground-mode 'dark)
 '(global-whitespace-mode t)
 '(inhibit-startup-screen t)
 '(keyboard-coding-system 'utf-8-dos)
 '(package-selected-packages
   '(geiser-racket geiser-guile geiser php-mode company-erlang erlang racket-mode crux web-mode yaml-mode chip8 kanagawa-theme ink-mode dot-env julia-mode nordic-night-theme company-box projectile typescript-mode cmake-mode lorem-ipsum fireplace orderless doom-themes free-keys license-templates dash powershell consult marginalia vertico ripgrep lsp-ui lsp-haskell eglot haskell-mode hindent sly gnuplot htmlize flycheck-rust lua-mode restart-emacs toml-mode rust-mode company-auctex math-symbol-lists ascii-table emmet-mode which-key gnuplot-mode auto-complete-c-headers company-c-headers ahk-mode rainbow-delimiters magit bash-completion company gdscript-mode ligature toc-org org-bullets org-appear org-super-agenda flycheck drag-stuff zoom use-package buffer-move simpleclip markdown-mode multiple-cursors treemacs gruber-darker-theme))
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

;;=# File loading
(load "~/.config/emacs/debug.el")
(load "~/.config/emacs/3le_functions.el")
(load "~/.config/emacs/package.el")

(mapc 'load (file-expand-wildcards "~/.config/emacs/config/*.el"))

(mapc 'load (file-expand-wildcards "~/.config/emacs/local/*.el"))

(mapc 'load (file-expand-wildcards "~/.config/emacs/mode/*.el"))

(mapc 'load (file-expand-wildcards "~/.config/emacs/package-conf/*.el"))


;;; init.el ends here.
