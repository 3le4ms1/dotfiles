;;; org-mode.el --- Configuration di orgmode

;;; Commentary:
;; Configuration of org-mode
;;; Code:

(setq-default org-support-shift-select t)

;; Shortcut per i #+begin_something <s <l <q
(require 'org-tempo)

(require 'org-inlinetask)

(use-package org-alert
  :ensure t
  :config (setq org-alert-interval 60
                org-alert-notify-cutoff 10
                org-alert-notify-after-event-cutoff 10))

(use-package org-appear
  :ensure t
  :config
  (setq org-appear-autolinks t
        org-appear-delay 0.1)
  (add-hook 'org-mode-hook #'org-appear-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-roam
  :ensure t)

(use-package ox-epub
  :ensure t)

(use-package ox-gemini
  :ensure t)

;; TODO: fixare minted, latexminted.exe, pygmentize.exe

;; (let ((org-latex-compile-custom-command "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(let ((org-latex-compile-custom-command "latexmk -pdf -shell-escape -interaction=nonstopmode -output-directory=%o %f"))
  (setq
   ;; aggiungere ([l]!/!) per timestamp al cambiamento
   org-todo-keywords '((sequence "TODO(t)" "PROG(p)" "NEXT(n)" "ONGN(o)" "INTR(i)" "|" "CNLD(c)" "DONE(d)"))
   org-ellipsis " ↓ "
   ;; org-pretty-entities t
   tempo-interactive t
   org-image-toggle-inline t
   org-image-actual-width nil
   org-adapt-indentation t
   org-hide-emphasis-markers nil
   org-agenda-block-separator ""
   org-fontify-whole-heading-line t
   org-fontify-done-headline t
   org-fontify-quote-and-verse-blocks t
   org-src-fontify-natively t
   org-src-block-faces (list '("latex" (:inherit latex-mode)))
   org-bullets-bullet-list '("●" "🞊" "🟂" "✦" "🟊" "✶")
   org-startup-with-inline-images t
   org-highlight-latex-and-related '(latex script entities)
   org-export-in-background t
   ;; org-export-async-init-file (concat 3le4ms1/emacs-conf-dir "/config/org-mode.el")
   org-latex-listings 'verbatim
   ;; org-latex-listings 'minted
   org-latex-packages-alist '(("newfloat" "minted"))
   org-latex-pdf-process (list org-latex-compile-custom-command)
   org-latex-hyperref-template "\\hypersetup{ verbose, pdfauthor={%a}, pdftitle={%t}, pdfkeywords={%k}, pdfsubject={%d}, pdfcreator={%c}, pdflang={%L}}"
   org-html-validation-link nil))

;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((awk . t)
   (gnuplot . t)
   (dot . t)))

;; Agenda
(setq org-agenda-files (concat (getenv "HOME") "/org/org-agenda/agenda-files.txt"))

;; remove key for duplicate line
(keymap-unset org-mode-map "C-,")

;; keys
(define-key org-mode-map (kbd "C-;") #'org-shiftdown)
(define-key org-mode-map (kbd "C-.") #'org-shiftright)
;;; org-mode.el ends here.
