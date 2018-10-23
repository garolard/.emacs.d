;; Supuestamente con esto basta...
(when (require 'elpy nil t)
  (elpy-enable))
(setq elpy-rpc-backend "jedi")
(when (load "flycheck" t )
  (setq elpy-modules (delq 'elpy-module-flycheck elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i")
