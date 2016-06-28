# ------------------------------
# Aliases
# ------------------------------

alias vi='vim'
#時刻を表示させる
alias history='history -E'

# ls
case "${OSTYPE}" in
darwin*)
  # Mac
  alias ls="ls -GF"
  alias ll='ls -lGF'
  alias la='ls -laGF'
  ;;
linux*)
  # Linux
  alias ls='ls -F --color'
  alias ll='ls -lF --color'
  alias la='ls -laF --color'
  ;;
esac

# 念のためrmではゴミ箱への移動のみ
alias rm="gmv -f --backup=numbered --target-directory ~/.Trash"
