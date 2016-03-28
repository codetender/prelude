(load-theme 'solarized-dark t)

(setq url-proxy-services '(("http" . "127.0.0.1:13333")
                           ("https" . "127.0.0.1:13333")))

(defadvice ansi-term (after advise-ansi-term-coding-system)
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)


(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

(prelude-require-packages '(smex multiple-cursors flx-ido iy-go-to-char))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-s-h")  'windmove-left)
(global-set-key (kbd "C-s-l")  'windmove-right)
(global-set-key (kbd "C-s-k")  'windmove-up)
(global-set-key (kbd "C-s-j")  'windmove-down)

(define-coding-system-alias 'UTF-8 'utf-8)
(define-coding-system-alias 'utf8 'utf-8)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun hook-org-mode ()
  (interactive)
  (variable-pitch-mode t))

(setq prelude-clean-whitespace-on-save nil)

(add-hook 'org-mode-hook 'hook-org-mode)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-k") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(server-start)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'iy-go-to-char)
(add-to-list 'mc/cursor-specific-vars 'iy-go-to-char-start-pos)
(global-set-key (kbd "s-f") 'iy-go-to-char)
(global-set-key (kbd "s-F") 'iy-go-to-char-backward)
(global-set-key (kbd "s-;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "s-,") 'iy-go-to-or-up-to-continue-backward)
