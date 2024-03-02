;;; Font --- Configurazione font

;;; Commentary:

;;; Code:

;;=# Font di default

;; Default font

(set-face-attribute 'default nil
                    ;; :family "Firacode NF"
                    :family "Iosevka NF"
                    :height 120
                    :weight 'regular
                    :width 'regular)

;; ;;=# Ligatures

(use-package ligature

  :config
;; ;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; ;; ;; Ligatures Firacode NF
;; (if (string= (face-attribute 'default :family) "Firacode NF")
;;     (progn (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
;;                                            ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
;;                                            "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
;;                                            "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
;;                                            "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
;;                                            "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
;;                                            "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
;;                                            "<*>" "<|" "<|>" "<$" "<$>" "$>" "<!--" "<-" "<--" "<->" "<+"
;;                                            "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
;;                                            "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%" ";;"
;;                                           ;; Aggiunti a mano
;;                                            ";;;"
;;                                            )))
(when (string= (face-attribute 'default :family) "Iosevka NF")
    (progn (ligature-set-ligatures 'prog-mode '(
                                                "<->" "<-->" "<--->" "<---->" "<----->"
                                                ;; Double-ended equals arrows ----------------
                                                "<=>" "<==>" "<===>" "<====>" "<=====>"
                                                ;; Double-ended asterisk operators ----------------
                                                "<**>" "<***>" "<****>" "<*****>"
                                                ;; HTML comments ----------------
                                                "<!--" "<!---" "--->"
                                                ;; Three-char ops with discards ----------------
                                                "<$" "<$>" "$>" "<." "<.>" ".>" "<*" "<*>"
                                                "*>" "<\\" "<\\>" "\\>" "</" "</>" "/>"
                                                "<\"" "<\">" "\">" "<'" "<'>" "'>" "<^"
                                                "<^>" "^>" "<&" "<&>" "&>" "<%" "<%>" "%>"
                                                "<@" "<@>" "@>" "<#" "<#>" "#>" "<+" "<+>"
                                                "+>" "<-" "<->" "->" "<!" "<!>" "!>" "<?"
                                                "<?>" "?>" "<|" "<|>" "|>" "<:" "<:>" ":>"
                                                ;; Colons ----------------
                                                "::" ":::" "::::"
                                                ;; Arrow-like operators ----------------
                                                "->" "->-" "->--" "->>" "->>-" "->>--"
                                                "->>>" "->>>-" "->>>--" "-->" "-->-"
                                                "-->--" "-->>" "-->>-" "-->>--" "-->>>"
                                                "-->>>-" "-->>>--" ">-" ">--" ">>-" ">>--"
                                                ">>>-" ">>>--" "=>" "=>=" "=>==" "=>>"
                                                "=>>=" "=>>==" "=>>>" "=>>>=" "=>>>=="
                                                "==>" "==>=" "==>==" "==>>" "==>>="
                                                "==>>==" "==>>>" "==>>>=" "==>>>=="
                                                ;; ">="
                                                ">==" ">>=" ">>==" ">>>=" ">>>==" "<-"
                                                "-<-" "--<-" "<<-" "-<<-" "--<<-" "<<<-"
                                                "-<<<-" "--<<<-" "<--" "-<--" "--<--"
                                                "<<--" "-<<--" "--<<--" "<<<--" "-<<<--"
                                                "--<<<--" "-<" "--<" "-<<" "--<<" "-<<<"
                                                "--<<<"
                                                ;; "<="
                                                "=<=" "==<=" "<<=" "=<<="
                                                "==<<=" "<<<=" "=<<<=" "==<<<=" "<=="
                                                "=<==" "==<==" "<<==" "=<<==" "==<<=="
                                                "<<<==" "=<<<==" "==<<<==" "=<" "==<" "=<<"
                                                "==<<" "=<<<" "==<<<"
                                                ;; Monadic operators ----------------
                                                ">=>" ">->" ">-->" ">==>" "<=<" "<-<"
                                                "<--<" "<==<"
                                                ;; Composition operators ----------------
                                                ">>" ">>>" "<<" "<<<"
                                                ;; Lens operators ----------------
                                                ":+" ":-" ":=" "+:" "-:" "=:" "=^" "=+"
                                                "=-" "=*" "=/" "=%" "^=" "+=" "-=" "*="
                                                "/=" "%="
                                                ;; Logical ----------------
                                                "/\\" "\\/"
                                                ;; Semigroup/monoid operators ----------------
                                                "<>" "<+" "<+>" "+>"
                                                )))
  )

(global-ligature-mode 't)

)
;;; font.el ends here.
