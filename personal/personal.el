(load-theme 'solarized-dark t)
(defadvice ansi-term (after advise-ansi-term-coding-system)
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)


(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

(prelude-require-packages '(smex golden-ratio))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "s-h")  'windmove-left)
(global-set-key (kbd "s-l")  'windmove-right)
(global-set-key (kbd "s-k")  'windmove-up)
(global-set-key (kbd "s-j")  'windmove-down)

(golden-ratio-mode t)

