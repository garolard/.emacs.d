;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.


;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)


(require 'use-package)
(require 'ido-vertical-mode)

(use-package ido-completing-read+
  :ensure t
  :bind (("C-x C-b" . ibuffer))
  :preface
  ;; This allows partial matches, e.g. "tl" will match "Tyrion Lannister"
  (setq ido-enable-flex-matching t)

  ;; Turn this behavior off because it's annoying
  (setq ido-use-filename-at-point nil)

  ;; Don't try to match file across all "work" directories; only match files
  ;; in the current directory displayed in the minibuffer
  (setq ido-auto-merge-work-directories-length -1)

  ;; Includes buffer names of recently open files, even if they're not
  ;; open now
  (setq ido-use-virtual-buffers t)

  ;; Muestra resultados de ido
  (setq ido-vertical-show-count 1)

  ;; Usa las flechas para navegar resultados por Dios
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

  :config
  ;; Easy navigation through options in minibuffer
  ;; http://www.emacswiki.org/emacs/InteractivelyDoThings
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-vertical-mode 1)

  ;; This enables ido in all contexts where it could be useful, not just
  ;; for selecting buffer and file names
  (ido-ubiquitous-mode 1))


;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands))
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize))

;; default navigation keybindings for windmove
(windmove-default-keybindings)

;; neotree - menu lateral para ver archivos
(use-package neotree
  :ensure t
  :preface

  ;; show current file when opened
  (setq neo-smart-open t)

  (defun select-open-file-in-neotree ()
    (interactive)
    (neotree-find (buffer-file-name)))

  ;; set neotree root to projectile root
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
	  (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
	  (if (neo-global--window-exists-p)
	      (progn
		(neotree-dir project-dir)
		(neotree-find file-name)))
	(message "Could not find git project root."))))

  :bind (([f8] . neotree-project-dir)
	 ("M-l" . select-open-file-in-neotree)))
