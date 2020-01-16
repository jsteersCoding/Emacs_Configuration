;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-theme 'tango-dark)
(defun tox ()
  ""
  (interactive)
  (compile "tox -e py27 && tox -e pep8"))
(global-set-key (kbd "C-x x") 'tox)

(defun covers ()
  ""
  (interactive)
  (compile "tox -r -e cover"))
(global-set-key (kbd "C-x t") 'covers)

(xterm-mouse-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-level 4)
 '(LaTeX-item-indent 0)
 '(auto-save-default nil)
 '(background-mode light)
 '(c-basic-offset 4)
 '(c-default-style "ellemtel")
 '(default-tab-width 4 t)
 '(desktop-file-name-format (quote tilde))
 '(desktop-load-locked-desktop nil)
 '(desktop-save nil)
 '(desktop-save-mode nil)
 '(display-time-mode t)
 '(fill-column 110)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote org-mode))
 '(initial-scratch-message "* SCRATCH
  ")
 '(ispell-dictionary "british")
 '(iswitchb-mode t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-babel-load-languages (quote ((emacs-lisp . t) (python . t))))
 '(org-src-fontify-natively t)
 '(org-src-tab-acts-natively t)
 '(org-tags-column -110)
 '(package-selected-packages (quote (json-mode gh-md flymd gnu-elpa-keyring-update ##)))
 '(scroll-conservatively 101)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(xterm-mouse-mode t))

(setq-default line-spacing 0.2)

(put 'narrow-to-region 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p)
(scroll-bar-mode -1)
(fringe-mode -1)

(global-subword-mode)
(display-time-mode)

(c-set-offset 'innamespace 0)

(global-set-key "\C-c l" 'org-store-link)

;;(global-set-key "\C-z" nil)
;;(global-set-key "\M-c" 'execute-extended-command)
;;(global-set-key "\C-x\C-u" 'undo) ; Somtimes mistaken for undo
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1))) ; Select previous window

(global-set-key (kbd "ESC <left>") 'windmove-left)
(global-set-key (kbd "ESC <up>") 'windmove-up)
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <down>") 'windmove-down)

(global-set-key (kbd "<f9>") 'compile)

;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.milkbox.net/packages/") t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; (require 'fastnav)
(global-set-key "\C-z" 'fastnav-jump-to-char-forward)
(global-set-key "\M-z" 'fastnav-zap-to-char-forward)

;; (require 'fiplr)
(global-set-key "\C-c\C-f" 'fiplr-find-file)
(global-set-key "\C-cff" 'fiplr-find-file)
(global-set-key "\C-cfc" 'fiplr-clear-cache)
(global-set-key "\C-cfd" 'fiplr-find-directory)

(setq file-name-shadow-properties file-name-shadow-tty-properties)

(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-c C-r") 'revert-buffer)

(defun fsh-windmove-up()
  (interactive)
  (condition-case nil
      (windmove-up)
    (error (other-frame 1))
    )
  )
(defun fsh-windmove-down()
  (interactive)
  (condition-case nil
      (windmove-down)
    (error (other-frame 1))
    )
  )
(defun fsh-windmove-left()
  (interactive)
  (condition-case nil
      (windmove-left)
    (error (other-frame 1))
    )
  )
(defun fsh-windmove-right()
  (interactive)
  (condition-case nil
      (windmove-right)
    (error (other-frame 1))
    )
  )

;; windmove keybindings
(global-set-key [\M-kp-6] 'fsh-windmove-right)
(global-set-key [\M-kp-4] 'fsh-windmove-left)
(global-set-key [\M-kp-8] 'fsh-windmove-up)
(global-set-key [\M-kp-2] 'fsh-windmove-down)

(global-set-key [\M-kp-1] 'shrink-window)
(global-set-key [\M-kp-7] 'enlarge-window)
(global-set-key [\M-kp-5] 'balance-windows)
(global-set-key [\M-kp-9] 'enlarge-window-horizontally)
(global-set-key [\M-kp-3] 'shrink-window-horizontally)

(defun fsh-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun fsh-timestamp ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

(defun fsh-create-org-scratch-buffer nil
  "create a scratch org-buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*org-scratch*"))
  (org-mode))

(defun fsh-kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;(fsh-create-org-scratch-buffer)

(defun fsh-term ()
  "Start a numbered terminal"
  (interactive)
  (let ((id 0) (buffer-name "*term-0*"))
    (while (get-buffer buffer-name)
      (setq id (+ id 1))
      (setq buffer-name (concat "*term-" (number-to-string id) "*")))
    (term "/bin/bash")
    (rename-buffer buffer-name)))

(defalias 'fterm 'fsh-term)

(defun fsh-untrampify-path (path)
  (mapconcat 'identity (last (split-string path ":")) ""))

(require 'tramp)
(require 'tramp-sh)
(defun fsh-sudo ()
  (interactive)
  (find-file
   (if (tramp-tramp-file-p buffer-file-name)
       (with-parsed-tramp-file-name buffer-file-name parsed
         (tramp-make-tramp-file-name
          "sudo"
          "root"
          parsed-host
          parsed-localname
          (let ((tramp-postfix-host-format "|")
                (tramp-prefix-format))
            (tramp-make-tramp-file-name
             "ssh"
             parsed-user
             parsed-host
             ""
             parsed-hop))))
     (tramp-make-tramp-file-name "sudo" "root" "localhost" buffer-file-name))))

(defun fsh-uniq (beg end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (sort-lines nil beg end)
      (beginning-of-buffer)
      (replace-regexp "\\([^\n]+\n\\)\\1+" "\\1"))))

(defun sort-words (reverse beg end)
  ;; SEE : http://emacs.stackexchange.com/questions/7548
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\(\\w\\|-\\|_\\)+" "\\&" beg end))

(defun fsh-startup ()
  (if (eq (current-buffer) (get-buffer "*scratch*"))
      (find-file ".")))

(add-hook 'emacs-startup-hook 'fsh-startup)

;; Autocomplete configuration
(if (locate-library "auto-complete")
    (progn
      (require 'auto-complete)
      (require 'auto-complete-config)
      (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
    (ac-config-default)))
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
