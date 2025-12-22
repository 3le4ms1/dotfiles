;;; pomm.el --- Configurazione del package `pomm'
;;; Commentary:

;;; Code:
(use-package pomm
  :ensure t
  :config
  (setq pomm-mode-line-mode t
        pomm-auto-enabled t
        pomm-audio-tick-enabled t
        pomm-audio-player-executable "mpv"))

;; pomm.el ends here.
