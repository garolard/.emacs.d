(require 'use-package)

(use-package elpy
  :ensure t
  :defer t
  :after python
  :config
  (elpy-enable)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package py-autopep8
  :after elpy
  :defer t
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
