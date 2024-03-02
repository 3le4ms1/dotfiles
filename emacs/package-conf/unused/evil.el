;;; evil.el --- Configurazione `evil'

;;; Commentary:
;; Configurare del package `evil' per i keybinding di Vim/Nvim

;;; Code:

;; =# Evil mode
(use-package evil

  :config
  (setq select-enable-clipboard t)
  (setq save-interprogram-paste-before-kill t)

  (setq mouse-drag-copy-region nil)
  (fset 'evil-visual-update-x-selection 'ignore)

  ;; Leader
  (evil-set-leader nil (kbd "<SPC>"))

  ;; Simpleclip
  (define-key evil-normal-state-map (kbd "y") 'simpleclip-copy)
  (define-key evil-visual-state-map (kbd "y") 'simpleclip-copy)

  (define-key evil-normal-state-map (kbd "p") 'simpleclip-paste)
  (define-key evil-visual-state-map (kbd "p") 'simpleclip-paste)

  (define-key evil-normal-state-map (kbd "C-y") 'simpleclip-paste)
  (define-key evil-visual-state-map (kbd "C-y") 'simpleclip-paste)
  (define-key evil-insert-state-map (kbd "C-y") 'simpleclip-paste)

  ;; Force Normal state
  (define-key evil-insert-state-map  (kbd "C-l") 'evil-force-normal-state)
  (define-key evil-visual-state-map  (kbd "C-l") 'evil-force-normal-state)
  (define-key evil-replace-state-map (kbd "C-l") 'evil-force-normal-state)

  ;; Dired Jump
  (define-key evil-normal-state-map (kbd "<leader> e") 'dired-jump)
  (define-key evil-visual-state-map (kbd "<leader> e") 'dired-jump)

  ;; Windmove
  (define-key evil-motion-state-map (kbd "C-c h") 'windmove-left)
  (define-key evil-motion-state-map (kbd "C-c j") 'windmove-down)
  (define-key evil-motion-state-map (kbd "C-c k") 'windmove-up)
  (define-key evil-motion-state-map (kbd "C-c l") 'windmove-right)

  (define-key evil-normal-state-map (kbd "C-c h") 'windmove-left)
  (define-key evil-normal-state-map (kbd "C-c j") 'windmove-down)
  (define-key evil-normal-state-map (kbd "C-c k") 'windmove-up)
  (define-key evil-normal-state-map (kbd "C-c l") 'windmove-right)

  ;; Buf Move
  (define-key evil-normal-state-map (kbd "C-M-h") 'buf-move-left)
  (define-key evil-normal-state-map (kbd "C-M-j") 'buf-move-down)
  (define-key evil-normal-state-map (kbd "C-M-k") 'buf-move-up)
  (define-key evil-normal-state-map (kbd "C-M-l") 'buf-move-right)

  ;; Drag Stuff
  (define-key evil-normal-state-map (kbd "M-k") #'drag-stuff-up)
  (define-key evil-normal-state-map (kbd "M-j") #'drag-stuff-down)

  ;; (evil-mode t)
  (global-set-key (kbd "C-x e") 'evil-mode)
  (global-set-key (kbd "C-c g d") 'evil-goto-definition)
  )

;;; evil.el ends here.
