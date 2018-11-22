;; Use clojure mode for other extensions
(require 'use-package)

(use-package clojure-mode
  :mode (("\\.edn$" . clojure-mode)
         ("\\.boot$" . clojure-mode)
         ("\\.cljs.*$" . clojure-mode)))

(use-package enh-ruby-mode
  :mode (("lein-env" . enh-ruby-mode)))


(add-hook 'clojure-mode-hook 'cider-mode)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'paredit-mode)

;; Auto-completado
;;(add-hook 'cider-repl-mode-hook 'company-mode)
;;(add-hook 'cider-mode-hook 'company-mode)

;; Salto de linea e identa
(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))


;; Virguerías para paréntesis

;; resaltar paréntesis (alguien lo activa antes pero por si acaso)
;;(show-paren-mode 1)
;; arcoiris para no morirse leyendo paréntesis
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; coloreado de símbolos
(require 'highlight-symbol)
