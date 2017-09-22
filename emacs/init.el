(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; git clone https://github.com/emacs-helm/helm
(add-to-list 'load-path "~/.emacs.d/helm")

(package-initialize)

(require 'helm-config)
(require 'helm-ls-git)
(global-set-key (kbd "C-c p f") 'helm-browse-project)

;;(load-file "~/.emacs.d/thrift-mode.el")

;; yaml
;; git clone https://github.com/yoshiki/yaml-mode
;;(load-file "~/.emacs.d/yaml-mode/yaml-mode.el")
;;(require 'yaml-mode)
;;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; markdown shittttt
;;(load-file "~/.emacs.d/markdown/markdown-mode.el")
;;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; dirtree shit
;;(add-to-list 'load-path "~/.emacs.d/dirtree")

(load-file "~/.emacs.d/better-defaults.el")

;; to make flx-ido happy
(load-file "~/.emacs.d/cl-lib-0.3.el")
(load-file "~/.emacs.d/grep-a-lot.el")
(add-to-list 'load-path "~/.emacs.d/flx")

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; kill the status message
(setq inhibit-startup-message t)

(setq line-number-mode -1)
(setq column-number-mode t)

;; if this breaks, blame lingo
(global-linum-mode t)
(setq linum-format "%3d ")
(global-visual-line-mode 1)

(global-font-lock-mode 1)
(require 'whitespace)

;; highlight the stuff you are marking
(setq transient-mark-mode t)

;; replace highlighted text with what i type
(delete-selection-mode t)

(load-theme 'Darkula t)

;; SCALA STUFF
;; git clone git://github.com/hvesalai/scala-mode2
(add-to-list 'load-path "~/.emacs.d/scala-mode2")
(require 'scala-mode2)
(load-file "~/.emacs.d/init-scala.el")
;; SCALA STUFF

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(global-set-key (kbd "C-l") 'goto-line)
(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

;; highlight long lines, son!
(add-hook 'scala-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{101\\}" 'hi-yellow)))
(add-hook 'java-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{101\\}" 'hi-yellow)))

(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; I know that string is in my Emacs somewhere!
(defcustom search-all-buffers-ignored-files (list (rx-to-string '(and bos (or ".bash_history" "TAGS") eos)))
  "Files to ignore when searching buffers via \\[search-all-buffers]."
  :type 'editable-list)

(require 'grep)
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

(global-set-key [f7] 'search-all-buffers)

(setq ruby-insert-encoding-magic-comment nil)

;; higlight line
(global-hl-line-mode 1)

(require 'flx-ido)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-tramp-completion nil)

(global-set-key (kbd "C-x <up>") 'shrink-window)
(global-set-key (kbd "C-x <down>") 'enlarge-window)
(global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)

;; Display ido results vertically, rather than horizontally
;; (setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
;; (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
;; (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
;; (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
;;   (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
;;   (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
;; (add-hook 'ido-setup-hook 'ido-define-keys)

(global-set-key (kbd "C-c g") 'vc-git-grep)

;; Put rgrep results in separate buffers
(require `grep-a-lot)
(grep-a-lot-setup-keys)

(require 'dirtree)

;; cuz I'm blind
(set-face-attribute 'default nil :height 140)

;; nuke whitespaces when writing to a file
(add-hook 'before-save-hook 'whitespace-cleanup)

;; set title bar to current buffer name
;; only works on X versions
(setq frame-title-format "%b")

;; one line at a time scrolling -- woot!
(setq scroll-step            1
      scroll-conservatively  10000)

;; set java stuff
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode nil)))
;; tags stuff
(setq tags-table-list
      '("~/.emacs.d/tags"))

;; copy shit into osx clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(setq compilation-scroll-output t)
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; turn on automatic bracket insertion by pairs. New in emacs 24
(electric-pair-mode 1)
(electric-indent-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
