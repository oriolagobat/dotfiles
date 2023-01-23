(setq inhibit-startup-message t)

(scroll-bar-mode -1)                                                                                    ; Disable visible scrollbar
(tool-bar-mode -1)                                                                                      ; Disable the toolbar
(tooltip-mode -1)                                                                                       ; Disable tooltips
(set-fringe-mode 10)                                                                                    ; Give some breathing room

(menu-bar-mode -1)                                                                                      ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)                                                                                   ; Makes the screen flash on error (ex: delete when impossible, ...)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 100)                                  ; Set the font and its size

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

;; Key-bindings
;; Some usefull keybindings
;; define-key method can be used to set a keybinding to just one mode
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)  ; Makes ESC key quit interactive prompts
(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)  ; Makes C-M-j switch buffer


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
;; FIRST-TIME: When running for the first time, we have to run the next command:
;; M-x all-the-icons-install-fonts
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
  (setq which-key-idle-delay 1))    ; Set delay for which-key to pop up


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
  :init (load-theme 'doom-palenight t))


;; General - Usefull keybindings
(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

;; EVIL mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; HYDRA
(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "t" '(:ignore t :which-key "toggles")
  "tt" '(counsel-load-theme :which-key "choose theme")
  "ts" '(hydra-text-scale/body :which-key "scale text"))
