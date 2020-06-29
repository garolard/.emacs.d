;; ag-projectile
(eval-after-load "projectile" (lambda ()
								(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
								(define-key projectile-mode-map (kbd "C-c p s") 'ag-files)))

;; Typescript
(eval-after-load "tide" (lambda ()
                          (define-key tide-mode-map (kbd "C-b") 'tide-jump-to-definition)
                          (define-key tide-mode-map (kbd "C--") 'tide-jump-back)
                          (define-key tide-mode-map (kbd "M-<f7>") 'tide-references)
                          (define-key tide-mode-map (kbd "M-<f12>") 'tide-project-errors)
                          (define-key tide-mode-map (kbd "<f2>") 'tide-rename-symbol)
                          (define-key tide-mode-map (kbd "C-M-l") 'tide-format)
                          (define-key tide-mode-map (kbd "M-RET") 'tide-fix)
						  (define-key tide-mode-map (kbd "C-S-t") 'tide-nav)))


;; Python
(eval-after-load "elpy" (lambda ()
                          (define-key elpy-mode-map (kbd "C-b") 'elpy-goto-definition)
                          (define-key elpy-mode-map (kbd "C--") 'pop-tag-mark)
                          (define-key elpy-mode-map (kbd "M-<f7>") 'xref-find-references)
                          (define-key elpy-mode-map (kbd "M-<f12>") 'elpy-check)
                          (define-key elpy-mode-map (kbd "<f2>") 'elpy-multiedit-python-symbol-at-point)
                          (define-key elpy-mode-map (kbd "C-M-l") 'elpy-format-code)
                          (define-key elpy-mode-map (kbd "M-RET") 'elpy-refactor)))

;; Javascript
;; Hay algunas que no tienen asignado nada
;; porque los comandos de js2-refactor
;; son un poco más liosos. Prefiero usar esos
;; como estén
(eval-after-load "js2-mode" (lambda ()
                              (define-key js2-mode-map (kbd "C-b") 'xref-find-definitions)
                              (define-key js2-mode-map (kbd "C--") 'xref-pop)
                              (define-key js2-mode-map (kbd "M-<f7>") 'xref-find-references)
                              (define-key js2-mode-map (kbd "M-<f12>") nil)
                              (define-key js2-mode-map (kbd "<f2>") nil)
                              (define-key js2-mode-map (kbd "C-M-l") nil)
                              (define-key js2-mode-map (kbd "M-RET") nil)))
