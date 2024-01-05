;; Enable lsp mode and other dependencies for golang

(setq package-list '(company yasnippet flycheck go-mode lsp-mode lsp-ui ))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
      (package-install package)))

(add-hook 'go-mode-hook (lambda ()
    (setq tab-width 4)))

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

(require 'lsp-mode)
;;(add-hook 'go-mode-hook #'lsp-deferred)

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(use-package lsp-mode
   :ensure t
   :init
   (setq lsp-gopls-server-args '("--remote=0.0.0.0:7050"))
   :commands (lsp lsp-deferred)
   :hook (go-mode . lsp-deferred)
   :config
   ;; Set up before-save hooks to format buffer and add/delete imports.
   ;; Make sure you don't have other gofmt/goimports hooks enabled.
   (defun lsp-go-install-save-hooks ()
      "Comment lsp-go-install-save-hooks."
      (add-hook 'before-save-hook #'lsp-format-buffer t t)
      (add-hook 'before-save-hook #'lsp-organize-imports t t))
   (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
   )

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'yas-minor-mode)

(defalias 'lsp--cur-line-diagnotics 'lsp--cur-line-diagnostics)
(setq lsp-enable-file-watchers nil)
