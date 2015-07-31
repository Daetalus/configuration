; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; ;  '(custom-enabled-themes (quote (tsdh-dark)))
;  '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ============================================================
; Setting English Font

(set-language-environment 'UTF-8)

(set-locale-environment "UTF-8")

(when window-system
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 100 60))

;;(set-face-font 'default "Source Code Pro-11")

;; Setting English Font
(set-face-attribute
  'default nil :font "Source Code Pro-11")

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "思源黑体 CN Normal" :size 18)))

(desktop-save-mode 1)
;; ****************************************************************************
;; ================================= Built-ins ================================
;; ----------------------------------------------------------------------------
;; --------------------------------- linum-mode -------------------------------
;; 从Emacs23开始，Emacs内置了linum-mode模式，可以显示行号
;;在左边显示行号
(global-linum-mode 'linum-mode)

;;启动时自动打开上次打开过的文件
;;(desktop-save-mode 1)
;; 处理Warning: desktop file appears to be in use by PID 19237这个问题
(setq-default desktop-load-locked-desktop t)

;; 标签页管理
(setq EmacsPortable-global-tabbar 't) ; 开启标签栏支持
;(setq EmacsPortable-global-ruler 't) ; 开启全局标尺
;(setq EmacsPortable-popup-menu 't) ; 弹出式菜单.
;(setq EmacsPortable-popup-toolbar 't) ; 弹出式工具栏
;(require 'tabbar-ruler)

;; 没有提示音，也不闪屏。
(setq ring-bell-function 'ignore)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p) 

;;滚动页面时比较舒服，不要整页的滚动 
(setq scroll-step 1 
scroll-margin 3 
scroll-conservatively 10000) 

;; set transparency
; (set-frame-parameter (selected-frame) 'alpha '(85 85))
; (add-to-list 'default-frame-alist '(alpha 85 85))
;;
;; 关闭工具栏
(tool-bar-mode -1)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; ================================= Theme ================================
;; Molokai themes
(load-theme 'atom-one-dark t)
