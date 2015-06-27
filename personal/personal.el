(load-theme 'solarized-dark t)
(defadvice ansi-term (after advise-ansi-term-coding-system)
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)


(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")
