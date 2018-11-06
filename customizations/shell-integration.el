;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

;; git-bash pseudo-integration
(defun git-bash () 
  (interactive)
  (let ((explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe"))
    (call-interactively 'shell)
    (rename-buffer "*git*")
    (toggle-truncate-lines)
    (insert "export PS1='\\[\\033[32m\\]\\u@\\h \\[\\033[33m\\]\\w\\[\\033[36m\\]`__git_ps1`\\[\\033[0m\\]\\n$ '")
    (comint-send-input nil t)))
