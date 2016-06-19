# ------------------------------
# .zshの読み込み
# ------------------------------
for f in ~/.zsh/[0-9]*.(sh|zsh)
do
    source "$f"
done


# ------------------------------
# # 他のファイルの読み込み
# ------------------------------
# Load common libray
. "$DOTPATH"/etc/scripts/common.sh

# ------------------------------
# tmux自動起動
# ------------------------------
source "$DOTPATH"/etc/scripts/tmux.sh


# ------------------------------
# zplug.zshの読み込み
# ------------------------------
if [[ -f ~/.zplug/init.zsh ]]; then
    source ~/.zplug/init.zsh
    export ZPLUG_LOADFILE="$HOME/.zsh/zplug.zsh"

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        else
            echo
        fi
    fi
    zplug load --verbose
fi

# Display zsh version and display number
printf "\n$fg_bold[cyan]This is ZSH $fg_bold[red]${ZSH_VERSION}"
printf "$fg_bold[cyan] - DISPLAY on $fg_bold[red]$DISPLAY$reset_color\n\n"
