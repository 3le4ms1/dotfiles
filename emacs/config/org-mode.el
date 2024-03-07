;;; org-mode.el --- Configurazione di orgmode

;;; Commentary:

;;; Code:

(setq-default org-support-shift-select t)

(add-hook 'org-mode-hook 'org-appear-mode)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Shortcut per i #+begin_something
(require 'org-tempo)
(require 'org-inlinetask)

(use-package org-bullets
  :ensure t
  )

(setq org-todo-keywords
      ;; aggiungere ([l]!/!) per timestamp al cambiamento
      '((sequence "TODO(t)" "PROG(p)" "NEXT(n)" "ONGN(o)" "INTR(i)" "|" "CNLD(c)" "DONE(d)"))
      org-ellipsis " ↓ "
      ;; org-pretty-entities t
      tempo-interactive t
      org-image-toggle-inline t
      org-adapt-indentation t
      org-hide-emphasis-markers nil
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t
      org-bullets-bullet-list '("●" "🞊" "🟂" "✦" "🟊" "✶")
      org-startup-with-inline-images t
      org-image-actual-width nil
      org-highlight-latex-and-related '(latex script entities)
      org-src-fontify-natively t
      org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f")
      )

;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((awk . t)
   (gnuplot . t)))
;; Agenda

;; (setq org-agenda-files "~/org-agenda")

;;; org-mode.el ends here.
