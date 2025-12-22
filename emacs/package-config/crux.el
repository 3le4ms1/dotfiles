;;; crux.el --- Configurazione per il package `crux'

;;; Commentary:

;;; Code:
(use-package crux
  :ensure t
  :config
  (global-set-key (kbd "C-S-K") #'crux-kill-whole-line)
  (global-set-key (kbd "C-a") #'crux-move-beginning-of-line)
  ;; (global-set-key (kbd "C-c o") #'crux-open-with)
  ;; (global-set-key [(shift return)] #'crux-smart-open-line)
  ;; (global-set-key (kbd "S-r") #'crux-recentf-find-file)
  ;; (global-set-key (kbd "C-<backspace>") #'crux-kill-line-backwards)
  )

;;; crux.el ends here.
