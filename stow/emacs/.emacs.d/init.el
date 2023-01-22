(setq inhibit-startup-message t)

(scroll-bar-mode -1)                                                                                    ; Disable visible scrollbar
(tool-bar-mode -1)                                                                                      ; Disable the toolbar
(tooltip-mode -1)                                                                                       ; Disable tooltips
(set-fringe-mode 10)                                                                                    ; Give some breathing room

(menu-bar-mode -1)                                                                                      ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)                                                                                   ; Makes the screen flash on error (ex: delete when impossible, ...)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 100)                                  ; Set the font and its size

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)                                                 ; Makes "ESC" key quit prompts

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^


;; Ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))


;; Doom Modeline Icons
(use-package all-the-icons)                                                                             ; Loads the icon package


;; Modeline (Doom)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


;; Line numbers

(column-number-mode)
(global-display-line-numbers-mode t)          ;; To have "normal" line numbers
;;(global-display-line-numbers-mode relative)    ;; To have relative line numbers

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook          ; Org mode
                term-mode-hook         ; Term mode
                shell-mode-hook        ; Shell mode
                treemacs-mode-hook     ; Treemacs mode
                eshell-mode-hook))     ; Eshell mode
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; Rainbow delimiters
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;; Which key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))    ; Set delay forwhich key to pop up


;; Ivy-rich
(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

;; Helpful
(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Doom themes
(use-package doom-themes
  :init (load-theme 'doom-one t))
