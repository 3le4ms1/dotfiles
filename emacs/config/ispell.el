;;; ispell.el --- Configurazione spell checking

;;; Commentary:
;; `ispell' permette di controllare lo spelling di buffere tramite il programma
;; `hunspell', che è un derivato del programma UNIX `spell'

;;; Code:


;; https://200ok.ch/posts/2020-08-22_setting_up_spell_checking_with_multiple_dictionaries.html

(use-package ispell
  :ensure t
  :config
  (when (eq system-type 'windows-nt)
    (setq ispell-program-name "C:\\ProgramData\\chocolatey\\bin\\hunspell.exe"))

  ;; Controllare la variabile `ispell-dictionary-alist' per la formattazione
  (add-to-list 'ispell-hunspell-dictionary-alist
               '("3le4ms1/italian"
                 "[A-Za-z]" "[^A-Za-z]" "[']" nil
                 ("-d" "it_IT") nil utf-8))

  (add-to-list 'ispell-hunspell-dictionary-alist
               '("3le4ms1/italian-english"
                 "[[:alpha:]]" "[^[:alpha:]]" "[']" nil
                 ("-d" "it_IT,en_US") nil utf-8))

  (when (eq system-type 'windows-nt)
    (add-to-list 'ispell-hunspell-dict-paths-alist
                 '("it_IT" . "C:\\Hunspell\\it_IT.dic"))
    (add-to-list 'ispell-hunspell-dict-paths-alist
                 '("it_IT" . "C:\\Hunspell\\it_IT.aff"))
    (add-to-list 'ispell-hunspell-dict-paths-alist
                 '("en_US" . "C:\\Hunspell\\en_US.dic"))
    )

  ;; (ispell-set-spellchecker-params)

  ;; (setq ispell-local-dictionary-alist ispell-hunspell-dictionary-alist)

  ;; (setq ispell-hunspell-dictionary "italian")
  ;; (setq ispell-local-dictionary "3le4ms1/italian-english")

  ;; (when (boundp 'ispell-hunspell-dictionary-alist)
  ;; (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist))
  )
;;; ispell.el ends here.
