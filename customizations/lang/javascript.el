(require 'use-package)

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode))
  :hook (
         (js2-mode-hook . js2-imenu-extras-mode)
         (js2-mode-hook . js2-refactor-mode)
         (js2-mode-hook . (lambda ()
                            (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
         (js2-mode-hook . (lambda ()
                            (tern-mode)))))

(use-package js2-refactor
  :ensure t
  :hook (js2-mode-hook . js2-refactor-mode)
  :config
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  (define-key js-mode-map (kbd "M-.") nil))

(use-package xref-js2
  :ensure t
  :hook (js2-mode-hook . (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

;; (use-package company-tern
;;   :ensure t
;;   :hook (js2-mode-hook . (lambda ()
;;                            (tern-mode)))
;;   :config 
;;   (add-to-list 'company-backends 'company-tern)
;;   (define-key tern-mode-keymap (kbd "M-.") nil)
;;   (define-key tern-mode-keymap (kbd "M-,") nil))
