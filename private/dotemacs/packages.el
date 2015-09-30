;;; packages.el --- dotemacs Layer packages File for Spacemacs
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

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq dotemacs-packages
    '(
      ;; package names go here
	  relative-line-numbers
      color-theme-solarized
      ))

;; List of packages to exclude.
(setq dotemacs-excluded-packages '())

(defun dotemacs/init-relative-line-numbers ()
  (use-package relative-line-numbers
    :defer t)
	(global-relative-line-numbers-mode))
	
(defun dotemacs/init-color-theme-solarized ()
  (use-package color-theme-solarized
    :defer t))

;; For each package, define a function dotemacs/init-<package-name>
;;
;; (defun dotemacs/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package