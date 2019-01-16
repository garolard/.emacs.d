(require 'use-package)

(use-package elpy
  :ensure t
  :after python
  :config
  (elpy-enable)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package py-autopep8
  :after elpy
  :hook ((elpy-mode . py-autopep8-enable-on-save)))
