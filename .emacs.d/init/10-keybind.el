;===================================
;; key binding
;===================================
(global-set-key (kbd "C-x ?") 'help-command)

(setq next-line-add-newlines nil)
(global-set-key "\C-h" 'delete-backward-char)

;; 
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-u") 'other-window)

;; \C-w
(defun kill-region-or-backward-kill-word (arg)
  (interactive "p")
  (if mark-active
          (let ((start (mark))
                        (end (point)))
                (kill-region start end))
        (backward-kill-word arg)))
(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)

;;
(define-key ctl-x-map "p" (lambda () (interactive) (other-window -1)))

;; etags
(global-set-key (kbd "M-g .")   'find-tag-regexp)
(global-set-key (kbd "C-M-.")   'find-tag-next)
(global-set-key (kbd "M-,")     'find-tag-other-window)
(defun list-tags-currentbuf ()
  "List the tags for the current buffer."
  (interactive)
  (list-tags (buffer-file-name)))
(global-set-key (kbd "M-/")     'list-tags-currentbuf)

;; anything
(global-set-key (kbd "C-x C-b") 'anything-buffers+)
(global-set-key (kbd "C-x C-f") 'anything-filelist+)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x C-v")  'find-file)
(global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-o") 'anything-c-moccur-dmoccur)
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "O") 'anything-c-moccur-dired-do-moccur-by-moccur)))

(global-set-key (kbd "M-TAB") 'auto-complete+)

; controll chrome
(defun chrome-scroll-next ()
      (interactive)
            (shell-command "/usr/bin/osascript ~/bin/chrome_scroll.scpt next"))

(defun chrome-scroll-previous ()
      (interactive)
            (shell-command "/usr/bin/osascript ~/bin/chrome_scroll.scpt prev"))

;(global-set-key (kbd "C-V") 'chrome-scroll-next)
;(global-set-key (kbd "M-V") 'chrome-scroll-previous)
