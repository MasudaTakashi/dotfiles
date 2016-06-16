;;**********************************************
;; 言語系
;;**********************************************
;; 言語設定
(set-language-environment 'Japanese)
;; 文字コード設定
(prefer-coding-system 'utf-8)



;;***********************************************
;; 全体の表示設定
;;***********************************************
;; 背景色
(if window-system (progn
		    (set-background-color "Black")
		    (set-foreground-color "LightGray")
		    (set-cursor-color "Gray")
		    (set-frame-parameter nil 'alpha 50) ;透明度
		    ))
;; 透明度を変更するコマンド M-x set-alpha
;; http://qiita.com/marcy@github/items/ba0d018a03381a964f24
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))
;; スタートアップ非表示
(setq inhibit-startup-screen t)
;; ツールバー非表示
(tool-bar-mode -1)
;; メニューバーを非表示
(menu-bar-mode -1)
;; スクロールバー非表示
(set-scroll-bar-mode nil)
;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))
;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
		    :foreground "#059"
		    :height 0.9)
;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")



;;***********************************************
;; 全体の設定
;;***********************************************
;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)
;; バックアップを残さない
(setq make-backup-files nil)
;; コピー/ペースト をクリップボードで行う
(setq x-select-enable-clipboard t)
;; ***補完設定***
;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;; 補完可能なものを随時表示
;; 少しうるさい
(icomplete-mode 1)



;;**********************************************
;; 位置
;;**********************************************
;; 現在行を目立たせる
(global-hl-line-mode)
;; 選択領域の色
(set-face-background 'region "#800")
;; 行番号フォーマット
(setq linum-format "%4d")
;; モードラインに行番号表示
(line-number-mode t)
;; モードラインに列番号表示
(column-number-mode t)
;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)
(when my-lines-page-mode
  (setq my-mode-line-format "%d")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
	 (setq my-mode-line-format (concat my-mode-line-format " (%%l,%%c)")))
	((eq line-number-mode t)
	 (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
	((eq column-number-mode t)
	 (setq my-mode-line-format (concat my-mode-line-format " C%%c"))))
  (setq mode-line-position
	'(:eval (format my-mode-line-format
			(count-lines (point-max) (point-min))))))



;;**********************************************
;; 括弧
;;**********************************************
;; 括弧の範囲内を強調表示
(show-paren-mode 1)
;(setq show-paren-delay 0)
;(setq show-paren-style 'expression)
;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#533")
;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)



;;**********************************************
;; 履歴
;;**********************************************
;; 最近使ったファイルをメニューに表示
(recentf-mode t)
;; 最近使ったファイルの表示数
(setq recentf-max-menu-items 10)
;; 最近開いたファイルの保存数を増やす
(setq recentf-max-saved-items 300)
;; ミニバッファの履歴を保存する
(savehist-mode 1)
;; ミニバッファの履歴の保存数を増やす
(setq history-length 300)



;;*******************************************
;;キーバインド
;;*******************************************
;; ctrl zをundoにする
(global-set-key "\C-z" 'undo)
;; コメントアウト
(define-key global-map (kbd "C-c ;") 'comment-dwim)
;; C-Ret で矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)
;; 改行でオートインデント
(global-set-key "\C-m" 'newline-and-indent)
;; M-jを入力すると対応するカッコに飛ぶ
(global-set-key (kbd "M-j") 'match-paren)



;;*************************************
;; GDB関連
;;*************************************
;; 有用なバッファを開くモード
(setq gdb-many-windows t)
;; 変数の上にマウスカーソルを置くと値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))
((lambda nil (gud-tooltip-mode t)))
;; I/O バッファを表示
(setq gdb-use-separate-io-buffer t)
;; t にすると mini buffer に値が表示される
(setq gud-tooltip-echo-area nil)



;;**********************************************
;; auto-complete
;;**********************************************
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ
