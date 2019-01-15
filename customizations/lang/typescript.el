;; Use web-mode for both ts and tsx files
;; (I prefer its syntax highlighting instead of typescript-mode)

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-setup)
         (typescript-mode . tide-set-keys)
         (before-save . tide-format-before-save)))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup)
              (tide-set-keys)
              (eldoc-mode 1))))
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; (defun setup-tide-on-web-mode ()
;;   (when (member (file-name-extension (or buffer-file-name "")) '("ts" "tsx"))
;; 	(setq flycheck-check-syntax-automatically '(save mode-enabled idle-change))
;; 	(setq web-mode-auto-quote-style 2) ; Use single quote
;; 	(eldoc-mode +1)))

;; Keybindings for tide
(defun tide-set-keys () 
  (local-set-key (kbd "C-c C-t r") 'tide-rename-symbol)
  (local-set-key (kbd "C-c C-t s") 'tide-restart-server)
  (local-set-key (kbd "C-c C-t f") 'tide-references)
  (local-set-key (kbd "C-c C-t e") 'tide-project-errors)
  (local-set-key (kbd "C-c C-t b") 'tide-jump-to-definition)
  (local-set-key (kbd "C-c C-t x") 'tide-fix)
  (local-set-key (kbd "M-RET") 'tide-fix))


;; (use-package web-mode
;;   :ensure t
;;   :mode (("\\.tsx\\'" . web-mode))
;;   :hook ((web-mode-hook setup-tide-mode)
;;          (web-mode-hook tide-setup-keys))
;;   :config ((flycheck-add-next-checker 'tsx-tide '(warning . typescript-tslint) 'append)
;;            (flycheck-add-mode 'typescript-tslint 'web-mode)))


;; Add web-mode to typescript-tslinst supported modes
;; (with-eval-after-load 'flycheck
  ;; (flycheck-add-mode 'typescript-tslint 'web-mode))

;; Ensure both tide an tslint checkers are used
;; https://github.com/ananthakumaran/tide/issues/95
;; (defun add-flycheck-checkers ()
;;   (with-eval-after-load 'flycheck
;;     (with-eval-after-load 'tide
;; 	  (flycheck-add-next-checker 'tsx-tide '(warning . typescript-tslint) 'append)
;; 	  (flycheck-add-mode 'typescript-tslint 'web-mode))))


;; Format document before saving with the right options
;; More options here: https://github.com/Microsoft/TypeScript/blob/cc58e2d7eb144f0b2ff89e6a6685fb4deaa24fde/src/server/protocol.d.ts#L421-473

(setq tide-format-options
	  '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t	:placeOpenBraceOnNewLineForFunctions nil :tabSize 4 :convertTabsToSpaces nil))

;; Detect compilation errors in compile-mode
(add-to-list 'compilation-error-regexp-alist '("^ERROR in \\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)):$" 1 2))
