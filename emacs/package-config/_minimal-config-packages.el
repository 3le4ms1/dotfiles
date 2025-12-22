;;; _minimal-config-packages.el --- Packages with minimal configuration

;;; Commentary:
;; List of packages that require little to no configuration

;;; Code:
(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook 'emmet-mode))

;; evaluation in-line of elisp files
;; (use-package eros
;;   :ensure t
;;   :config
;;   (eros-mode 1))

;; (use-package zig-mode
;;   :ensure t
;;   :config
;;   (setq zig-format-on-save-mode nil))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;;; _minimal-config-packages.el ends here.
