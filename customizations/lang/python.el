(elpy-enable)
(when (require 'flycheck nil t)
  (print "Cargando flycheck para elpy")
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(print "Cargando autopep8 para elpy")
