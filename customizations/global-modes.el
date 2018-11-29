;; Parenthesis highlight
(show-paren-mode 1)

;; Automatic insert matching delimiters
(electric-pair-mode 1)

(require 'use-package)

;; Auto-complete everywhere
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package projectile
  ;; projectile everywhere!
  :config
  (projectile-global-mode))

(use-package google-this
  :config
  (google-this-mode))
