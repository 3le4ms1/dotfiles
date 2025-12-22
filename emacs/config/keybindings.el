;;; keybindings.el --- Keybindings globali

;;; Commentary:
;; Keybindings globali customizzate
;; Qui non devono comparire keybindings che fanno riferimento ad uno o più
;; package specifici, dal momento che potrei decidere in un secondo momento di
;; volerli disinstallare o disattivare.  Per questioni di compatibilità i
;; keibinding in questo file devono usare solo comandi nativi di `emacs'

;;; Code:

(global-set-key (kbd "C-+")             #'text-scale-increase)
;; ansi-us layout compatibility
(global-set-key (kbd "C-=")             #'text-scale-increase)
(global-set-key (kbd "C--")             #'text-scale-decrease)
(global-set-key (kbd "C-0")             #'text-scale-adjust)
(global-set-key (kbd "<C-wheel-up>")    #'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>")  #'text-scale-decrease)

;; (global-set-key (kbd "C-x b") 'ibuffer)
;; (global-set-key (kbd "C-S-a") #'mark-whole-buffer)

;; (global-set-key (kbd "C-<tab>") 'next-buffer)
;; (global-set-key (kbd "C-S-<tab>") 'previous-buffer)

(global-set-key (kbd "C-ù") #'comment-line)
;; ansi-us layout compatibility
(global-set-key (kbd "C-\\") #'comment-line)

(global-set-key (kbd "C-<return>") (kbd "M-j"))

(global-set-key (kbd "C-x 2") (lambda () (interactive) (split-window-vertically)   (other-window 1)))
(global-set-key (kbd "C-x 3") (lambda () (interactive) (split-window-horizontally) (other-window 1)))

(global-set-key (kbd "C-x C-b") #'bs-show)

(global-set-key (kbd "C-c a") #'org-agenda)

(global-set-key (kbd "C-,") (lambda ()
                              (interactive)
                              "Duplicate current line."
                              (let ((column (- (point) (line-beginning-position)))
                                    (line (let ((s (thing-at-point 'line t)))
                                            (if s (string-remove-suffix "\n" s) ""))))
                                (move-end-of-line 1)
                                (newline)
                                (insert line)
                                (move-beginning-of-line 1)
                                (forward-char column))))

;; =# Inserimento caratteri `{' e `}' in layout italiano
(global-set-key (kbd "C-M-*") (lambda ()
                  (interactive)
                  (insert-char #x7d)))

(global-set-key (kbd "C-M-é") (lambda ()
                  (interactive)
                  (insert-char #x7b)
                  (insert-char #x7d)
                  (backward-char)))

;;; keybindings.el ends here.
