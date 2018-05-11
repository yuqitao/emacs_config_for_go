(require 'cl)
(when (>= emacs-major-version 24)
	(package-initialize)
	(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages") t)
)
(defvar yuqitao/packages '(
	company
	monokai-theme
	hungry-delete
	swiper
	counsel
	smartparens
	popwin
	)
)
(setq package-selected-packages yuqitao/packages)
(defun yuqitao/packages-installed-p()
	(loop for pkg in yuqitao/packages
		when (not (package-installed-p pkg)) do (return nil)
		finally (return t) 
	)
)
(unless (yuqitao/packages-installed-p)
	(message "%s" "Refreshing package database...")
	(package-refresh-contents)
	(dolist (pkg yuqitao/packages)
		(when (not (package-installed-p pkg))
			(package-install pkg)
		)
	)
)
(global-hungry-delete-mode)
(require 'smartparens-config)
(smartparens-global-mode t)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-company-mode t)
(load-theme 'monokai t)
(require 'pop-win)
(popwin-mode t)
(provide 'init-packages)