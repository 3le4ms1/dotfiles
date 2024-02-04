;;; keybindings.el --- Keybindings globali

;;; Commentary:
;; Keybindings globali customizzate
;; Qui non devono comparire keybindings che fanno riferimento ad uno o più
;; package specifici, dal momento che potrei decidere in un secondo momento di
;; volerli disinstallare o disattivare.  Per questioni di compatibilità i
;; keibinding in questo file devono usare solo comandi nativi di `emacs'

;;; Code:

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; (global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-S-a") 'mark-whole-buffer)

;; (global-set-key (kbd "C-<tab>") 'next-buffer)
;; (global-set-key (kbd "C-S-<tab>") 'previous-buffer)

(global-set-key (kbd "C-ù") 'comment-line)

(global-set-key (kbd "C-<return>") (kbd "M-j"))

(global-set-key "\C-x2" (lambda () (interactive) (split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive) (split-window-horizontally) (other-window 1)))

(global-set-key (kbd "C-x C-b") 'bs-show)

(global-set-key (kbd "C-c C-<SPC>") 'company-complete)

(global-set-key (kbd "C-c d") (lambda ()
                                (interactive)
                                (move-beginning-of-line 1)
                                (kill-line)
                                (yank)
                                (open-line 1)
                                (next-line 1)
                                (yank)))

;; =# Inserimento caratteri `{' e `}'
(global-set-key (kbd "C-M-*") (lambda ()
                  (interactive)
                  (insert-char #x7d)))

(global-set-key (kbd "C-M-é") (lambda ()
                  (interactive)
                  (insert-char #x7b)
                  (insert-char #x7d)
                  (backward-char)))

;;; keybindings.el ends here.
