;; emacs configuration
(push "/usr/local/bin" exec-path)

;===================================
;; elpa 24>
;===================================
(when  (require 'package nil t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize))
 
;; (require 'package)
;; (setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
;; (package-initialize)

;;; load-path
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp")
;;

(add-to-list 'load-path "~/.emacs.d/riece/share/emacs/site-lisp/riece")

(require 'el-get)

;; recipes
(setq el-get-sources
     '(
	   (:name auto-complete
			  :type git
			  :url "https://github.com/m2ym/auto-complete.git"
			  :load "auto-complete.el")
	   (:name auto-complete-plus
			  :type http
			  :url "https://raw.github.com/serenade/Serenade_System_Config/2bbb0cab7a9f2a392c1381abc9408dbb8482477a/emacs/home/Plugin/auto-complete+.el"
			  :load "auto-complete+.el")
       (:name init-loader
              :type http
              :url "http://coderepos.org/share/export/39089/lang/elisp/init-loader/init-loader.el"
              :load "init-loader.el")
       (:name sticky
              :type git
              :url "https://github.com/emacsmirror/sticky.git"
              :load "sticky.el")
       (:name recentf-ext
              :type emacswiki
              :features "recentf-ext")
       (:name gist :type elpa)
       (:name twittering-mode :type elpa)
	   (:name google
			  :type http
			  :url "http://www.bookshelf.jp/elc/google.el"
			  :load "google.el")
       (:name fold-dwim
              :type git
              :url "https://github.com/emacsmirror/fold-dwim.git"
              :load "fold-dwim.el")
       (:name anything-config
              :type git
              :url "git://repo.or.cz/anything-config.git"
              :load "anything-config.el")
       (:name descbinds-anything
              :type git
              :url "https://github.com/emacsmirror/descbinds-anything.git"
              :load "descbinds-anything.el")
       (:name color-moccur
              :type emacswiki)
       (:name moccur-edit
              :type emacswiki)
       (:name anything-c-moccur
              :type svn
              :url "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk")
       (:name anything-exuberant-ctags
              :type git
              :url "https://github.com/k1LoW/anything-exuberant-ctags.git"
              :load "anything-exuberant-ctags.el")
       (:name anything-rdefs
              :type git
              :url "https://github.com/wakaran/anything-rdefs.git"
              :load "anything-rdefs.el")
       (:name wdired
              :type emacswiki)
       (:name quickrun
              :type git
              :url "https://github.com/syohex/emacs-quickrun.git"
              :load "quickrun.el")
       (:name httpcode
              :type git
              :url "https://github.com/rspivak/httpcode.el.git"
              :load "httpcode.el")
       (:name coffee-mode
             :type git
              :url "https://github.com/defunkt/coffee-mode.git"
              :load "coffee-mode.el")
       (:name rvm
             :type git
              :url "http://github.com/djwhitt/rvm.el.git"
              :load "rvm.el"
              :compile ("rvm.el")
              :after (lambda() (rvm-use-default)))
       (:name rhtml
              :type git
              :url "https://github.com/eschulte/rhtml.git"
              :features rhtml-mode)
	   ;; lang-mode
       (:name csv-mode
              :type git
              :url "https://github.com/emacsmirror/csv-mode.git"
              :features csv-mode)  
       (:name ruby-mode
              :type elpa
              :load "ruby-mode.el")
       (:name inf-ruby  :type elpa)
       (:name ruby-compilation :type elpa)
       (:name css-mode :type elpa)
       (:name yaml-mode
              :type git
              :url "http://github.com/yoshiki/yaml-mode.git"
              :features yaml-mode)
	   (:name markdown-mode
			  :type git
			  :url "git://jblevins.org/git/markdown-mode.git"
			  :features markdown-mode)
))
(el-get 'sync)

(require 'init-loader)
(init-loader-load "~/.emacs.d/init")