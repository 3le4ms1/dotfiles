;;; web-mode.el --- Configurazione `web-mode'

;;; Commentary:

;;; Code:

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp$"   . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache$"  . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml$"    . web-mode))


  (add-to-list 'auto-mode-alist '("\\.html$"  . web-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.css$"   . web-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.scss$"  . web-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.js$"    . web-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.ts$"    . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx$"   . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx$"   . web-mode))

  (add-hook 'web-mode-hook #'emmet-mode)
  ;; (add-hook 'web-mode-hoook #'(lambda ()
  ;;                               (cond (global-prettify-symbols-mode)
  ;;                                     (prettify-symbols-mode nil))))
  )
;;; web-mode.el ends here.
