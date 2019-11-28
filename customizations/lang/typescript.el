;; Use web-mode for both ts and tsx files
;; (I prefer its syntax highlighting instead of typescript-mode)

(setq-default indent-tabs-mode 1)
(setq-default tab-width 4)

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-setup)
;         (typescript-mode . tide-set-keys)
         (before-save . tide-format-before-save)))

(use-package web-mode
  :ensure t
  :mode (("\\.tsx\\'" . web-mode))
  :hook (web-mode . setup-ts-for-web-mode)
  :config
  (flycheck-add-mode 'typescript-tslint 'web-mode))

(defun setup-ts-for-web-mode ()
  (when (string-equal "tsx" (file-name-extension buffer-file-name))
    (tide-setup)
	(setq web-mode-auto-quote-style 2) ; use single quote
 ;   (tide-set-keys) ; Deshabilitado porque ya configuro los atajos en key-bindings.el
    (eldoc-mode 1)))

;; Keybindings for tide
(defun tide-set-keys () 
  (local-set-key (kbd "C-c C-t r") 'tide-rename-symbol)
  (local-set-key (kbd "C-c C-t s") 'tide-restart-server)
  (local-set-key (kbd "C-c C-t f") 'tide-references)
  (local-set-key (kbd "C-c C-t e") 'tide-project-errors)
  (local-set-key (kbd "C-c C-t b") 'tide-jump-to-definition)
  (local-set-key (kbd "C-c C-t x") 'tide-fix)
  (local-set-key (kbd "M-RET") 'tide-fix))

;; Format document before saving with the right options
;; More options here: https://github.com/Microsoft/TypeScript/blob/cc58e2d7eb144f0b2ff89e6a6685fb4deaa24fde/src/server/protocol.d.ts#L421-473

(setq tide-format-options
	  '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t	:placeOpenBraceOnNewLineForFunctions nil :tabSize 4 :convertTabsToSpaces nil))

;; Detect compilation errors in compile-mode
(add-to-list 'compilation-error-regexp-alist '("^ERROR in \\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)):$" 1 2))
