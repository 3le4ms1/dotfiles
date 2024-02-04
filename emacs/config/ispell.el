;;; ispell.el --- Configurazione spell checking

;;; Commentary:
;; `ispell' permette di controllare lo spelling di buffere tramite il programma
;; `hunspell', che è un derivato del programma UNIX `spell'

;;; Code:


(require 'ispell)
(setq ispell-program-name "hunspell")

;; Controllare la variabile `ispell-dictionary-alist' per la formattazione
(add-to-list 'ispell-hunspell-dictionary-alist
             '("3le/italian"
               "[A-Za-z]" "[^A-Za-z]" "[']" nil
               ("-d" "it_IT") nil utf-8))

(add-to-list 'ispell-hunspell-dictionary-alist
             '("3le/italian-english"
               "[[:alpha:]]" "[^[:alpha:]]" "[']" nil
               ("-d" "it_IT,en_US") nil utf-8))

;; (setq ispell-local-dictionary-alist ispell-hunspell-dictionary-alist)

;; (setq ispell-hunspell-dictionary "italian")
;; (setq ispell-local-dictionary "3le/italian-english")

;; (when (boundp 'ispell-hunspell-dictionary-alist)
  ;; (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist))

;;; ispell.el ends here.
