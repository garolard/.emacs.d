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
  :init
  (projectile-mode)
  (setq projectile-indexing-method 'alien)
  :config
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))
  
(use-package google-this
  :ensure t
  :config
  (google-this-mode))
