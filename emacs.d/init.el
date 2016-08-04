;; package manager

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; INIT MANAGEMENT
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; INTERFACE
    ;; Open in same window
    (setq ns-pop-up-frames nil)

    ;; evil-mode
    (require 'evil)
    (evil-mode 1)

;; APPEARANCE
    ;; theme
    (load-theme 'badwolf t)
