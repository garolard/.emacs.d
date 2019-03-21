;; Tide
(eval-after-load "tide" (lambda ()
                          (define-key tide-mode-map (kbd "C-b") 'tide-jump-to-definition)
                          (define-key tide-mode-map (kbd "C--") 'tide-jump-back)
                          (define-key tide-mode-map (kbd "M-<f7>") 'tide-references)
                          (define-key tide-mode-map (kbd "M-<f12>") 'tide-project-errors)
                          (define-key tide-mode-map (kbd "<f2>") 'tide-rename-symbol)
                          (define-key tide-mode-map (kbd "C-M-l") 'tide-format)
                          (define-key tide-mode-map (kbd "M-RET") 'tide-fix)))
