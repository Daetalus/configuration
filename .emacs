(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ============================================================
;; Setting English Font
(set-face-attribute
  'default nil :font "Consolas 11")
 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 16)))
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

;; 使用标准的Win32对话框打开文件
(load-file "~/.emacs.d/dlgopen.el")

;; 标签页管理
(setq EmacsPortable-global-tabbar 't) ; 开启标签栏支持
;(setq EmacsPortable-global-ruler 't) ; 开启全局标尺
;(setq EmacsPortable-popup-menu 't) ; 弹出式菜单.
;(setq EmacsPortable-popup-toolbar 't) ; 弹出式工具栏
;(require 'tabbar-ruler)

;; 没有提示音，也不闪屏。
(setq ring-bell-function 'ignore)

;; ================================= Theme ================================
;; Molokai themes
