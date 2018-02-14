;MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;ESS Required by polymode-r-markdown
(require 'ess-site)

;Markdown-mode Required by polymode-r-markdown
(require 'markdown-mode)

;r-markdown
(defun rmd-mode ()
  "ESS Markdown mode for rmd files"
  (interactive)
  ;;(setq load-path 
  ;;  (append (list "/home/zequi/.emacs" "path/to/polymode/modes/")
  ;;      load-path))
  (require 'poly-R)
  (require 'poly-markdown)     
  (poly-markdown+r-mode))

;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; easy keys to split window. Key based on ErgoEmacs keybinding
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-below) ; split pane top/bottom
(global-set-key (kbd "M-2") 'delete-window) ; close current pane
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane
(put 'dired-find-alternate-file 'disabled nil)

;; Evil mode
;(require 'evil)
;(evil-mode 1)
;(custom-set-variables
; ;; custom-set-variables was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(custom-safe-themes
;   (quote
;    ("7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" default))))
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; )

;; Base16 theme
(load-theme 'base16-monokai t)

;; ibuffer by default
(defalias 'list-buffers 'ibuffer)

;; load httpd.el
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "apache-mode.el")

;; Always show line number
(global-linum-mode 1)

;;
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   (quote
;;    (magit base16-theme yaml-mode polymode nord-theme markdown-mode evil ess ample-theme))))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(font-lock-variable-name-face ((t (:foreground "green3")))))
;;
