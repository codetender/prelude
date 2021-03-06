(load-theme 'solarized-dark t)

;; (setq url-proxy-services '(("http" . "127.0.0.1:13333")
;;                            ("https" . "127.0.0.1:13333")))

(defun toggle-proxy ()
  (interactive)
  (if (eq url-proxy-services '())
      (progn
        (setq url-proxy-services '(("http" . "127.0.0.1:13333")
                                   ("https" . "127.0.0.1:13333")))
        (message "proxy set"))
    (progn (setq url-proxy-services '())) (message "proxy unset")))

(message url-proxy-services)
(defadvice ansi-term (after advise-ansi-term-coding-system)
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(setq redisplay-dont-pause t)
(set-language-environment 'utf-8)

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "Noto Sans CJK SC"
                                       :size 14)))

(add-hook 'gfm-mode-hook
          '(lambda ()
             (setq visual-line-fringe-indicators t)
             (visual-line-mode)
             (if visual-line-mode
                 (setq word-wrap nil))))
;; (setq ido-use-virtual-buffers t)
(setq-default indent-tabs-mode nil)



(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)


(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

(prelude-require-packages '(smex multiple-cursors
                                 ;; flx-ido
                                 iy-go-to-char
                                 yasnippet elixir-mode alchemist rust-mode cargo))

;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-s-h")  'windmove-left)
(global-set-key (kbd "C-s-l")  'windmove-right)
(global-set-key (kbd "C-s-k")  'windmove-up)
(global-set-key (kbd "C-s-j")  'windmove-down)

(define-coding-system-alias 'UTF-8 'utf-8)
(define-coding-system-alias 'utf8 'utf-8)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun hook-org-mode ()
  (interactive))

(defun hook-elixir-mode ()
  (alchemist-mode))

(setq prelude-clean-whitespace-on-save nil)

(add-hook 'org-mode-hook 'hook-org-mode)
(add-hook 'elixir-mode-hook 'hook-elixir-mode)

(require 'multiple-cursors)
(global-company-mode)
(global-set-key (kbd "s-e") 'mc/edit-lines)
(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(global-set-key (kbd "s-n") 'mc/skip-to-next-like-this)
(global-set-key (kbd "s-S-d") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(server-start)

;; (require 'flx-ido)

;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)

;; (setq ido-enable-flex-matching t) ;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)

(require 'iy-go-to-char)
(add-to-list 'mc/cursor-specific-vars 'iy-go-to-char-start-pos)
(global-set-key (kbd "s-f") 'iy-go-to-char)
(global-set-key (kbd "s-F") 'iy-go-to-char-backward)
(global-set-key (kbd "s-;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "s-,") 'iy-go-to-or-up-to-continue-backward)

(setq prelude-whitespace nil)

(setq yas-snippet-dirs
      '("~/.emacs.d/yasnippet-snippets"                 ;; personal snippets
        "~/.emacs.d/personal/snippets"
        ))

(yas-global-mode 1)

(require 'projectile)
(require 'helm-projectile)
(helm-projectile-on)

(defun jump-to-file-and-line ()
  (interactive)
  (let ((line (buffer-substring-no-properties (point-at-bol) (point-at-eol))))
    (let ((tuple (string-match "\\([a-zA-Z/._]+\\):\\([0-9]+\\)" line)))
      (let ((file (match-string 1 line))
            (lnum (match-string 2 line))
            (dir (projectile-project-root)))
        (when (and file (file-exists-p (concat dir file)))
          (find-file-other-window (concat dir file))
          (and lnum (goto-line (string-to-number lnum))))))))

(global-set-key (kbd "s-]") 'jump-to-file-and-line)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'term-mode-hook (lambda()
                            (yas-minor-mode -1)))
(add-hook 'shell-mode-hook (lambda()
                            (yas-minor-mode -1)))

(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)

(with-eval-after-load 'writeroom-mode
  (define-key writeroom-mode-map (kbd "C-M-<") #'writeroom-decrease-width)
  (define-key writeroom-mode-map (kbd "C-M->") #'writeroom-increase-width)
  (define-key writeroom-mode-map (kbd "C-M-=") #'writeroom-adjust-width))
