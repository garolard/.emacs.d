;; Use web-mode for both ts and tsx files
;; (I prefer its syntax highlighting instead of typescript-mode)

<<<<<<< HEAD
(setq-default indent-tabs-mode 1)
(setq-default tab-width 4)

(use-package tide
=======
(use-package flycheck
>>>>>>> Intentando mejorar la integración con TS/TSX
  :ensure t
  :config
  (add-hook 'typescript-mode-hook 'flycheck-mode))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package company
  :ensure t
  :config
<<<<<<< HEAD
  (flycheck-add-mode 'typescript-tslint 'web-mode))

(defun setup-ts-for-web-mode ()
  (when (string-equal "tsx" (file-name-extension buffer-file-name))
    (tide-setup)
	(setq web-mode-auto-quote-style 2) ; use single quote
 ;   (tide-set-keys) ; Deshabilitado porque ya configuro los atajos en key-bindings.el
    (eldoc-mode 1)))
=======
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  (global-company-mode))
>>>>>>> Intentando mejorar la integración con TS/TSX

(use-package company-quickhelp
  :ensure t
  :init
  (company-quickhelp-mode 1)
  (use-package pos-tip
    :ensure))

(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 4
        web-mode-css-indent-offset 4
        web-mode-code-indent-offset 4
        web-mode-block-padding 4
        
        web-mode-enable-css-colorization t
        web-mode-enable-auto-pairing t
        web-mode-enable-comment-keywords t
        web-mode-enable-current-element-highlight t)
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  (flycheck-add-mode 'typescript-tslint 'web-mode))

(use-package typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 4)
  (add-hook 'typescript-mode #'subword-mode))

(use-package tide
  :init
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
