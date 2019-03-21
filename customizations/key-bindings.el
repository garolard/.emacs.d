;; Typescript
(eval-after-load "tide" (lambda ()
                          (define-key tide-mode-map (kbd "C-b") 'tide-jump-to-definition)
                          (define-key tide-mode-map (kbd "C--") 'tide-jump-back)
                          (define-key tide-mode-map (kbd "M-<f7>") 'tide-references)
                          (define-key tide-mode-map (kbd "M-<f12>") 'tide-project-errors)
                          (define-key tide-mode-map (kbd "<f2>") 'tide-rename-symbol)
                          (define-key tide-mode-map (kbd "C-M-l") 'tide-format)
                          (define-key tide-mode-map (kbd "M-RET") 'tide-fix)))


;; Python
(eval-after-load "elpy" (lambda ()
                          (define-key elpy-mode-map (kbd "C-b") 'elpy-goto-definition)
                          (define-key elpy-mode-map (kbd "C--") 'pop-tag-mark)
                          (define-key elpy-mode-map (kbd "M-<f7>") 'xref-find-references)
                          (define-key elpy-mode-map (kbd "M-<f12>") 'elpy-check)
                          (define-key elpy-mode-map (kbd "<f2>") 'elpy-multiedit-python-symbol-at-point)
                          (define-key elpy-mode-map (kbd "C-M-l") 'elpy-format-code)
                          (define-key elpy-mode-map (kbd "M-RET") 'elpy-refactor)))
