;; Parenthesis highlight
(show-paren-mode 1)

;; Automatic insert matching delimiters
(electric-pair-mode 1)

(require 'use-package)

;; Auto-complete everywhere
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package projectile
  ;; projectile everywhere!
  :ensure t
  :config
  (projectile-global-mode))

(use-package google-this
  :ensure t
  :config
  (google-this-mode))
