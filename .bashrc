# ctrl+s で出力がロックされてしまうのを防ぐ
stty stop undef

# よく使うエイリアスやら各コマンドのデフォルトのオプションを設定
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias ps='ps --sort=start_time'
alias vi='vim'

# アプリケーション
alias enju='$HOME/workspace/mt/tools/enju-2.4.2/enju'
alias lapos='$HOME/workspace/mt/tools/lapos-0.1.2/lapos -m $HOME/workspace/mt/tools/lapos-0.1.2/model_wsj02-21/'


# プロンプトの表示をカスタマイズ
#export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\]'
export PS1='\[\033[01;32m\]\u:\w \$\[\033[00m\] '

# 環境変数の設定
# 基本的なもの
export PATH=$PATH:/sbin:/usr/sbin # パス
export PATH=/usr/local/bin:$PATH
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export HISTSIZE=100 # コマンド履歴を残す
export LANG='ja_JP.UTF-8' # 文字コード
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
export PGDATA=/usr/local/var/postgres #postgresql

# SRILM関係
export SRILM=$HOME/workspace/mt/tools/srilm
export MACHINE_TYPE=macosx
export PATH=$PATH:$SRILM/bin:$SRILM/bin/macosx
export MANPATH=$MANPATH:$SRILM/man
# 自分のディレクトリにインストールしたもの
export PATH=$PATH:$HOME/usr/local/bin
