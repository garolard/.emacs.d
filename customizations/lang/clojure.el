;; Use clojure mode for other extensions
(require 'use-package)

(use-package clojure-mode
  :ensure t
  :mode (("\\.edn$" . clojure-mode)
         ("\\.boot$" . clojure-mode)
         ("\\.cljs.*$" . clojure-mode)))

(use-package enh-ruby-mode
  :ensure t
  :mode (("lein-env" . enh-ruby-mode)))


(use-package cider
  :ensure t
  :defer t
  :config 
  (add-hook 'clojure-mode-hook 'cider-mode)
  (add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent))))

;; enable paredit in your REPL
(use-package paredit
  :ensure t
  :defer t
  :config
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-mode-hook 'paredit-mode))

;; Virguerías para paréntesis

;; resaltar paréntesis (alguien lo activa antes pero por si acaso)
;;(show-paren-mode 1)
;; arcoiris para no morirse leyendo paréntesis
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; coloreado de símbolos
(use-package highlight-symbol
  :ensure t)
