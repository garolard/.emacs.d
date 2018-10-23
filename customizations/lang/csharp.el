(eval-after-load
  'company
  '(add-to-list 'company-backends 'company-omnisharp))

(defun setup-csharp ()
  (omnisharp-mode)
  (company-mode)
;;  (flycheck-mode)
  (electric-pair-local-mode 1)
  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile)
  (setq omnisharp-server-executable-path "C:\\Program Files (x86)\\omnisharp-win-x86\\OmniSharp.exe"))

(add-hook 'csharp-mode-hook 'setup-csharp)
