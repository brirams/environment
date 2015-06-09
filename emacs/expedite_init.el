(setq user-full-name "Brian Ramos")
(setq user-mail-address "brian@expeditelabs.com")

;; need this for loop
(require 'cl)

(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(defvar bramos/packages '(better-defaults
                          dirtree
                          flx-ido
                          grep-a-lot
                          helm
                          helm-ls-git
                          magit
                          markdown-mode
                          org
                          ruby-mode
                          scala-mode2
                          yaml-mode)
  "Default packages")

;; install the packages1
(defun bramos/packages-installed-p ()
  (loop for pkg in bramos/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (bramos/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg bramos/packages)
    (when (not (package-installed-p pkg))
            (package-install pkg))))

;; some functions that we need
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; copy shit into osx clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

;; I know that string is in my Emacs somewhere!
(defcustom search-all-buffers-ignored-files (list (rx-to-string '(and bos (or ".bash_history" "TAGS") eos)))
  "Files to ignore when searching buffers via \\[search-all-buffers]."
  :type 'editable-list)

(defun search-all-buffers (regexp prefix)
    "Searches file-visiting buffers for occurence of REGEXP.  With
prefix > 1 (i.e., if you type C-u \\[search-all-buffers]),
searches all buffers."
    (interactive (list (grep-read-regexp)
                       current-prefix-arg))
    (message "Regexp is %s; prefix is %s" regexp prefix)
    (multi-occur
     (if (member prefix '(4 (4)))
         (buffer-list)
       (remove-if
        (lambda (b) (some (lambda (rx) (string-match rx  (file-name-nondirectory (buffer-file-name b)))) search-all-buffers-ignored-files))
        (remove-if-not 'buffer-file-name (buffer-list))))
     regexp))

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

;; Display ido results vertically, rather than horizontally
;; (setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
;; (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
;; (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
;; (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
;;   (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
;;   (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
;; (add-hook 'ido-setup-hook 'ido-define-keys)

(require 'recentf)
(require 'whitespace)
(require 'helm-config)
(require 'helm-ls-git)
(require 'scala-mode2)
(require 'flx-ido)
(require 'grep-a-lot)
(require 'dirtree)
(require 'ansi-color)
(require 'grep)

;; turn some stuff off
(setq inhibit-splash-screen 1
      initial-scratch-message nil
      inhibit-startup-message 1
      linum-format "%3d "
      initial-major-mode 'org-mode
      recentf-max-menu-items 25
      transient-mark-mode 1
      ruby-insert-encoding-magic-comment 0
      magit-last-seen-setup-instructions "1.4.0"
      ido-use-faces 0
      ido-enable-flex-matching 1
      ido-create-new-buffer 'always
      ido-enable-tramp-completion 0
      scroll-step 1
      scroll-conservatively 10000
      tags-table-list '("~/.emacs.d/tags")
      compilation-scroll-output 1
      frame-title-format "%b" ;; set title bar to current buffer name
)

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(global-visual-line-mode 1)
(global-font-lock-mode 1)
(line-number-mode 0)
(column-number-mode 1)
(global-linum-mode 1)
(recentf-mode 1)
(delete-selection-mode 1)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(grep-a-lot-setup-keys)
(global-hl-line-mode 1)
(electric-pair-mode 1)
(electric-indent-mode 1)

(global-set-key (kbd "C-c p f") 'helm-browse-project)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key "%" 'match-paren)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key [f7] 'search-all-buffers)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-c") 'ask-before-closing)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; highlight long lines, son!
(add-hook 'scala-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{101\\}" 'hi-yellow)))
(add-hook 'java-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{101\\}" 'hi-yellow)))
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode nil)))

(load-file "~/.emacs.d/thrift-mode.el")
(load-file "~/.emacs.d/init-scala.el")

;; this is the old hotness
(load-theme 'Darkula 1)
