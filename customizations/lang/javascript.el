(require 'use-package)

(use-package js2-mode
  :ensure t
  :defer t
  :mode (("\\.js\\'" . js2-mode))
  :config (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(use-package js2-refactor)
(use-package xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; Los comandos de refactorización quedan prefijados con este keybinding
(js2r-add-keybindings-with-prefix "C-c C-m")

;; "mata" (kill) el texto hasta final de línea pero manteniendo el AST de js válido
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; un-bind "M-." from js-mode which conflicts with xref
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; remapeo el mover linea arriba y abajo porque está definido en editing.el y quiero que en
;; ficheros js lo haga bien
(define-key js2-mode-map (kbd "M-<up>") 'js2r-move-line-up)
(define-key js2-mode-map (kbd "M-<down>") 'js2r-move-line-down)

(use-package company-tern
  :defer t
  :config 
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook (lambda () (tern-mode)))
  (add-hook 'rjsx-mode-hook (lambda () (tern-mode))))
