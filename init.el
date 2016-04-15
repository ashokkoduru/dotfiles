;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

(setq gc-cons-threshold 100000000)
(defconst spacemacs-version          "0.104.1" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.3" "Minimal version of Emacs.")

(defun spacemacs/emacs-version-ok ()
  (version<= spacemacs-emacs-min-version emacs-version))

(when (spacemacs/emacs-version-ok)
  (load-file (concat user-emacs-directory "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (require 'core-configuration-layer)
  (spacemacs/init)
  (spacemacs/maybe-install-dotfile)
  (configuration-layer/sync)
  (spacemacs/setup-startup-hook)
  (require 'server)
  (unless (server-running-p) (server-start))
)


;; (defhydra my/window-resize (global-map "<f2>")
;;   "Window Move"
;;   ("<left>" windmove-left)
;;   ("<right>" windmove-right)
;;   ("<up>" windmove-up)
;;   ("<down>" windmove-down))

(global-set-key (kbd "C-c r") 'restart-emacs)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; (global-set-key (kbd "C-<left>") 'sp-backward-slurp-sexp)
;; (global-set-key (kbd "C-<right>") 'sp-forward-slurp-sexp)
;; (global-set-key (kbd "M-<right>") 'sp-forward-barf-sexp)
;; (global-set-key (kbd "M-<left>") 'sp-backward-barf-sexp)

(global-set-key [f2 right] 'windmove-right)
(global-set-key [f2 left] 'windmove-left)
(global-set-key [f2 up] 'windmove-up)
(global-set-key [f2 down] 'windmove-down)


(define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)

;; (global-set-key [M-up] 'move-text-up)
;; (global-set-key [M-down] 'move-text-down)

;; (drag-stuff-global-mode)

(evil-leader/set-key
  "/" 'split-window-right-and-focus
  "-" 'split-window-below-and-focus
  "^" 'spacemacs/toggle-maximize-buffer
  "d" 'ido-dired
  "k" 'evil-window-delete
  "b" 'helm-buffers-list ;;ido-switch-buffer
  "nn" 'spacemacs/new-empty-buffer
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "ee" 'my/open-shell-right-and-focus
  "ss" 'shell
  "rp" 'my/run-python)

(defun my/run-python()
  (interactive)
  (python-shell-send-file '(buffer-file-name))
  (python-shell-switch-to-shell)
)

(defun my/edit-init-file ()
  (interactive)
  (find-file user-init-file))

(defun my/edit-dotspacemacs-file ()
  (interactive)
  (find-file dotspacemacs-filepath))

(defun my/open-shell-right-and-focus ()
  (interactive)
  (split-window-right-and-focus)
  (eshell)
  (evil-window-set-width 68)
)

(define-key evil-normal-state-map ";bd" 'kill-this-buffer)
(define-key evil-normal-state-map ";ei" 'my/edit-init-file)
(define-key evil-normal-state-map ";es" 'my/edit-dotspacemacs-file)
(define-key evil-normal-state-map "ZZ" 'save-buffer)
(define-key evil-insert-state-map "ZZ" 'save-buffer)

;;(global-relative-line-numbers-mode)

(set-frame-font "Monaco")

;; (load-theme 'leuven)
(load-theme 'leuven)

(setq-default evil-escape-key-sequence "fd")
(setq-default powerline-default-separator 'arrow)

(add-hook 'python-mode-hook
          '(lambda()
             (setq python-indent-offset 4)))

(toggle-frame-maximized)

;; (setq powerline-separators '(alternate arrow arrow-fade bar box brace butt chamfer contour curve rounded roundstub slant wave zigzag nil))

;; (defun my/cycle-powerline-separators ()
;;   (interactive)
;;   (unless powerline-separators
;;     (setq powerline-separators '(alternate arrow arrow-fade bar box brace butt chamfer contour curve rounded roundstub slant wave zigzag nil)))
;;   (evil-echo (defvar powerline-default-separator (pop powerline-separators))))

;; (global-set-key (kbd "<f5>") 'my/cycle-powerline-separators)

(defun evil-replace-word-under-cursor()
  (interactive)
  (if (use-region-p)
      (let
      (selection (buffer-substring-no-properties (region-beginning) (region-end)))
    (if (= (length selection) 0)
        (message "empty string")
      (evil-ex (concat "'<,'>s/" selection "/"))))
    (evil-ex (concat "%s/" (thing-at-point 'word) "/")))
  )
