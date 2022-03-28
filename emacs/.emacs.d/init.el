;;; Basic repositories.
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("elpa"  . "http://tromey.com/elpa/")
			             ("gnu"   . "http://elpa.gnu.org/packages/")
			             ("melpa" . "https://melpa.org/packages/")
			             ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)

;;; Secure the `use-package` macro.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; My dotfiles are symlinked in place so this makes the startup way less
;; annoying.
(setq vc-follow-symlinks t)

;; Load the main configuration file.
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "GOOG" :family "Roboto Mono")))))
