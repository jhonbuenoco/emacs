;; init.el --- Emacs configuration

;; Set OSX function key as Meta


;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(add-to-list 'package-archives                                                                                                        
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))   
(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/") t)

;; activate all packages
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; define list of packages to install
(defvar myPackages
  '(better-defaults
    material-theme
    exec-path-from-shell
    elpy
    pyenv-mode))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; Use shell's $PATH
(exec-path-from-shell-copy-env "PATH")

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pyenv-mode exec-path-from-shell yasnippet-snippets find-file-in-project material-theme elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t)   ;; hide the startup message
(load-theme 'material t)           ;; load material theme

(require 'linum)
(global-linum-mode t)              ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")  ;; format line number spacing
;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; define list of packages to install
(defvar myPackages
  '(better-defaults
    material-theme
    elpy))

(elpy-enable)

(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

;; (pyenv-mode)
;; (require 'pyenv-mode)

;;(defun projectile-pyenv-mode-set ()
;;  "Set pyenv version matching project name."
;;  (let ((project (projectile-project-name)))
;;    (if (member project (pyenv-mode-versions))
;;        (pyenv-mode-set project)
;;      (pyenv-mode-unset))))

;;(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)

(setq make-backup-files nil) ; stop creating ~ files

(setq elpy-rpc-python-command "python3")

(setq elpy-rpc-virtualenv-path 'current)

(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

(setq column-number-mode t)

(setq c-default-style "bsd"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)
