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

(global-set-key (kbd "C-<left>") 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-<right>") 'sp-forward-slurp-sexp)
(global-set-key (kbd "M-<right>") 'sp-forward-barf-sexp)
(global-set-key (kbd "M-<left>") 'sp-backward-barf-sexp)



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
  "ib" 'ibuffer ;;'helm-buffers-list ;;ido-switch-buffer
  "b" 'helm-buffers-list
  "nn" 'spacemacs/new-empty-buffer
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "ee" 'my/open-shell-right-and-focus
  "ss" 'shell
  "rp" 'my/run-python
  "ei" 'my/edit-init-file
  "es" 'my/edit-dotspacemacs-file
  "ff" 'projectile-find-file)

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
(define-key evil-normal-state-map "ZZ" 'save-buffer)
(define-key evil-insert-state-map "ZZ" 'save-buffer)

(global-relative-line-numbers-mode)

(set-frame-font "Monaco")

(add-to-list 'custom-theme-load-path "~/.emacs.d/private/themes")

(load-theme 'leuven)
;; (load-theme 'base16-flat-light)

(setq-default evil-escape-key-sequence "fd")
(setq-default powerline-default-separator 'arrow)

(add-hook 'python-mode-hook
          '(lambda()
             (setq python-indent-offset 4)))

(toggle-frame-maximized)

;; (defun my/cycle-powerline-separators ()
;;   (interactive)
;;   (unless powerline-separators
;;     (setq powerline-separators '(arrow bar box brace butt chamfer contour curve rounded roundstub slant wave zigzag nil)))
;;   (evil-echo (setq powerline-default-separator (pop powerline-separators))))

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

(defun powerline-vimish-theme ()
  "Setup the default mode-line."
  ;; Populate our faces
  (mapcar 'eval  (powerline--generate-facedefs powerline-vim-colors-alist))
  (set-face-attribute 'mode-line-inactive nil
                      :background (face-background (pl/vim-face "SPLIT" "inactive")) :underline nil
                      :overline nil :box nil)
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (harddiv-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (harddiv-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (softdiv-left (cl-case powerline-default-separator
                                          ((utf-8 arrow) "")
                                          ((bar nil) "|")
                                          (brace "}")
                                          (t ">")))
                          (softdiv-right (cl-case powerline-default-separator
                                          ((utf-8 arrow) "")
                                          ((bar nil) "|")
                                          (brace "{")
                                          (t "<")))
                          (editor-state (cond ((and active (boundp 'evil-mode) evil-mode)
                                               (symbol-name evil-state))
                                              (active "active")
                                              (t "inactive")))
                          (state-indicator-face (pl/vim-face "state_indicator" editor-state))
                          (vc-face              (pl/vim-face "branch" editor-state))
                          (fileinfo-face        (pl/vim-face "fileinfo" editor-state))
                          (split-face           (pl/vim-face "SPLIT" editor-state))

                          (fileformat-face      (pl/vim-face "fileformat" editor-state))
                          (fileencoding-face    (pl/vim-face "fileencoding" editor-state))
                          (filetype-face        (pl/vim-face "filetype" editor-state))

                          (scrollpercent-face   (pl/vim-face "scrollpercent" editor-state))
                          (lineinfo-face        (pl/vim-face "lineinfo" editor-state))
                          (input (split-string (symbol-name buffer-file-coding-system) "-"))
                          (platform (check-in-list input '("mac" "unix" "dos")))
                          (encoding (mapconcat 'identity (delete platform input) "-"))
                          ;; Left hand side
                          (lhs (list
                                (powerline-raw (format " %s " (upcase editor-state)) state-indicator-face)
                                (funcall harddiv-left state-indicator-face vc-face)
                                (when (and (buffer-file-name (current-buffer)) vc-mode)
                                  (concat
                                   (powerline-raw (downcase (format-mode-line '(vc-mode vc-mode))) vc-face 'r)
                                   (powerline-raw softdiv-left vc-face)))
                                (powerline-buffer-id fileinfo-face 'l)
                                (powerline-raw "%*" fileinfo-face 'lr)
                                (powerline-narrow fileinfo-face 'l)
                                (funcall harddiv-left fileinfo-face split-face)))

                          ;; Right Hand Side
                          (rhs (list
                                (powerline-raw (format "%s" (point)) split-face 'r)
                                (funcall harddiv-right split-face fileformat-face)
                                (powerline-raw global-mode-string split-face 'r)
                                (funcall harddiv-right split-face fileformat-face)
                                (concat
                                 (when (not (null platform))
                                   (concat (powerline-raw platform fileformat-face 'r)
                                           (powerline-raw softdiv-right fileformat-face)))
                                 (powerline-raw encoding fileencoding-face 'lr)
                                 (powerline-raw softdiv-right fileencoding-face))
                                (powerline-major-mode filetype-face 'lr)
                                (funcall harddiv-right filetype-face scrollpercent-face)
                                (powerline-raw "%p" scrollpercent-face 'lr)
                                (funcall harddiv-right scrollpercent-face lineinfo-face)
                                (powerline-raw "%l" lineinfo-face 'l)
                                (powerline-raw ":" lineinfo-face 'lr)
                                (powerline-raw "%c" lineinfo-face 'r))))

                     (when active
                       (set-face-attribute 'mode-line nil :underline nil :overline nil :box nil))
                     (if (and (null powerline-default-separator)
                              (null  (face-attribute 'powerline-SPLIT-normal :overline)))
                         nil
                       nil)
                     (concat (powerline-render lhs)
                             (powerline-fill split-face (powerline-width rhs))
                             (powerline-render rhs)))))))

(powerline-vimish-theme)

(defhydra hydra-ibuffer-main (:color pink :hint nil)
  "
 ^Navigation^ | ^Mark^        | ^Actions^        | ^View^
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
  _k_:    ʌ   | _m_: mark     | _D_: delete      | _g_: refresh
 _RET_: visit | _u_: unmark   | _S_: save        | _s_: sort
  _j_:    v   | _*_: specific | _a_: all actions | _/_: filter
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
"
  ("j" ibuffer-forward-line)
  ("RET" ibuffer-visit-buffer :color blue)
  ("k" ibuffer-backward-line)

  ("m" ibuffer-mark-forward)
  ("u" ibuffer-unmark-forward)
  ("*" hydra-ibuffer-mark/body :color blue)

  ("D" ibuffer-do-delete)
  ("S" ibuffer-do-save)
  ("a" hydra-ibuffer-action/body :color blue)

  ("g" ibuffer-update)
  ("s" hydra-ibuffer-sort/body :color blue)
  ("/" hydra-ibuffer-filter/body :color blue)

  ("o" ibuffer-visit-buffer-other-window "other window" :color blue)
  ("q" ibuffer-quit "quit ibuffer" :color blue)
  ("." nil "toggle hydra" :color blue))

(defhydra hydra-ibuffer-mark (:color teal :columns 5
                              :after-exit (hydra-ibuffer-main/body))
  "Mark"
  ("*" ibuffer-unmark-all "unmark all")
  ("M" ibuffer-mark-by-mode "mode")
  ("m" ibuffer-mark-modified-buffers "modified")
  ("u" ibuffer-mark-unsaved-buffers "unsaved")
  ("s" ibuffer-mark-special-buffers "special")
  ("r" ibuffer-mark-read-only-buffers "read-only")
  ("/" ibuffer-mark-dired-buffers "dired")
  ("e" ibuffer-mark-dissociated-buffers "dissociated")
  ("h" ibuffer-mark-help-buffers "help")
  ("z" ibuffer-mark-compressed-file-buffers "compressed")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-action (:color teal :columns 4
                                :after-exit
                                (if (eq major-mode 'ibuffer-mode)
                                    (hydra-ibuffer-main/body)))
  "Action"
  ("A" ibuffer-do-view "view")
  ("E" ibuffer-do-eval "eval")
  ("F" ibuffer-do-shell-command-file "shell-command-file")
  ("I" ibuffer-do-query-replace-regexp "query-replace-regexp")
  ("H" ibuffer-do-view-other-frame "view-other-frame")
  ("N" ibuffer-do-shell-command-pipe-replace "shell-cmd-pipe-replace")
  ("M" ibuffer-do-toggle-modified "toggle-modified")
  ("O" ibuffer-do-occur "occur")
  ("P" ibuffer-do-print "print")
  ("Q" ibuffer-do-query-replace "query-replace")
  ("R" ibuffer-do-rename-uniquely "rename-uniquely")
  ("T" ibuffer-do-toggle-read-only "toggle-read-only")
  ("U" ibuffer-do-replace-regexp "replace-regexp")
  ("V" ibuffer-do-revert "revert")
  ("W" ibuffer-do-view-and-eval "view-and-eval")
  ("X" ibuffer-do-shell-command-pipe "shell-command-pipe")
  ("b" nil "back"))

(defhydra hydra-ibuffer-sort (:color amaranth :columns 3)
  "Sort"
  ("i" ibuffer-invert-sorting "invert")
  ("a" ibuffer-do-sort-by-alphabetic "alphabetic")
  ("v" ibuffer-do-sort-by-recency "recently used")
  ("s" ibuffer-do-sort-by-size "size")
  ("f" ibuffer-do-sort-by-filename/process "filename")
  ("m" ibuffer-do-sort-by-major-mode "mode")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-filter (:color amaranth :columns 4)
  "Filter"
  ("m" ibuffer-filter-by-used-mode "mode")
  ("M" ibuffer-filter-by-derived-mode "derived mode")
  ("n" ibuffer-filter-by-name "name")
  ("c" ibuffer-filter-by-content "content")
  ("e" ibuffer-filter-by-predicate "predicate")
  ("f" ibuffer-filter-by-filename "filename")
  (">" ibuffer-filter-by-size-gt "size")
  ("<" ibuffer-filter-by-size-lt "size")
  ("/" ibuffer-filter-disable "disable")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(add-hook 'ibuffer-hook #'hydra-ibuffer-main/body)

(define-key evil-normal-state-map "zc" 'evil-close-fold)
(define-key evil-normal-state-map "zC" 'evil-close-folds)
(define-key evil-normal-state-map "zo" 'evil-open-fold)
(define-key evil-normal-state-map "zO" 'evil-open-folds)
(define-key evil-normal-state-map "za" 'evil-open-fold-rec)

(defhydra hydra-window-move (global-map "<f2>")
  "Window Move Hydra"
  ("<right>" windmove-right)
  ("<left>" windmove-left)
  ("<up>" windmove-up)
  ("<down>" windmove-down))

;; (global-set-key [f2 right] 'windmove-right)
;; (global-set-key [f2 left] 'windmove-left)
;; (global-set-key [f2 up] 'windmove-up)
;; (global-set-key [f2 down] 'windmove-down)

(defhydra hydra-learn-sp (:hint nil)
  "
  _B_ backward-sexp            -----
  _F_ forward-sexp               _s_ splice-sexp
  _L_ backward-down-sexp         _df_ splice-sexp-killing-forward
  _H_ backward-up-sexp           _db_ splice-sexp-killing-backward
^^------                         _da_ splice-sexp-killing-around
  _k_ down-sexp                -----
  _j_ up-sexp                    _C-s_ select-next-thing-exchange
-^^-----                         _C-p_ select-previous-thing
  _n_ next-sexp                  _C-n_ select-next-thing
  _p_ previous-sexp            -----
  _a_ beginning-of-sexp          _C-f_ forward-symbol
  _z_ end-of-sexp                _C-b_ backward-symbol
--^^-                          -----
  _t_ transpose-sexp             _c_ convolute-sexp
-^^--                            _g_ absorb-sexp
  _x_ delete-char                _q_ emit-sexp
  _dw_ kill-word               -----
  _dd_ kill-sexp                 _,b_ extract-before-sexp
-^^--                            _,a_ extract-after-sexp
  _S_ unwrap-sexp              -----
-^^--                            _AP_ add-to-previous-sexp
  _C-h_ forward-slurp-sexp       _AN_ add-to-next-sexp
  _C-l_ forward-barf-sexp      -----
  _C-S-h_ backward-slurp-sexp    _ join-sexp
  _C-S-l_ backward-barf-sexp     _|_ split-sexp
"
  ;; TODO: Use () and [] - + * | <space>
  ("B" sp-backward-sexp );; similiar to VIM b
  ("F" sp-forward-sexp );; similar to VIM f
  ;;
  ("L" sp-backward-down-sexp )
  ("H" sp-backward-up-sexp )
  ;;
  ("k" sp-down-sexp ) ; root - towards the root
  ("j" sp-up-sexp )
  ;;
  ("n" sp-next-sexp )
  ("p" sp-previous-sexp )
  ;; a..z
  ("a" sp-beginning-of-sexp )
  ("z" sp-end-of-sexp )
  ;;
  ("t" sp-transpose-sexp )
  ;;
  ("x" sp-delete-char )
  ("dw" sp-kill-word )
  ;;("ds" sp-kill-symbol ) ;; Prefer kill-sexp
  ("dd" sp-kill-sexp )
  ;;("yy" sp-copy-sexp ) ;; Don't like it. Pref visual selection
  ;;
  ("S" sp-unwrap-sexp ) ;; Strip!
  ;;("wh" sp-backward-unwrap-sexp ) ;; Too similar to above
  ;;
  ("C-h" sp-forward-slurp-sexp )
  ("C-l" sp-forward-barf-sexp )
  ("C-S-h" sp-backward-slurp-sexp )
  ("C-S-l" sp-backward-barf-sexp )
  ;;
  ;;("C-[" (bind (sp-wrap-with-pair "[")) ) ;;FIXME
  ;;("C-(" (bind (sp-wrap-with-pair "(")) )
  ;;
  ("s" sp-splice-sexp )
  ("df" sp-splice-sexp-killing-forward )
  ("db" sp-splice-sexp-killing-backward )
  ("da" sp-splice-sexp-killing-around )
  ;;
  ("C-s" sp-select-next-thing-exchange )
  ("C-p" sp-select-previous-thing )
  ("C-n" sp-select-next-thing )
  ;;
  ("C-f" sp-forward-symbol )
  ("C-b" sp-backward-symbol )
  ;;
  ;;("C-t" sp-prefix-tag-object)
  ;;("H-p" sp-prefix-pair-object)
  ("c" sp-convolute-sexp )
  ("g" sp-absorb-sexp )
  ("q" sp-emit-sexp )
  ;;
  (",b" sp-extract-before-sexp )
  (",a" sp-extract-after-sexp )
  ;;
  ("AP" sp-add-to-previous-sexp );; Difference to slurp?
  ("AN" sp-add-to-next-sexp )
  ;;
  ("_" sp-join-sexp ) ;;Good
  ("|" sp-split-sexp )) 

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(setq web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-code-indent-offset 2)
(setq js-indent-level 2)


(add-hook 'projectile-after-switch-project-hook 'mjs/setup-local-eslint)

(defun mjs/setup-local-eslint ()
  "If ESLint found in node_modules directory - use that for flycheck.
Intended for use in PROJECTILE-AFTER-SWITCH-PROJECT-HOOK."
  (interactive)
  (let ((local-eslint (expand-file-name "./node_modules/.bin/eslint")))
    (setq flycheck-javascript-eslint-executable
          (and (file-exists-p local-eslint) local-eslint))))

(with-eval-after-load 'flycheck
  (push 'web-mode (flycheck-checker-get 'javascript-eslint 'modes))))
