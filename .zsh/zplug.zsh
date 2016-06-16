source ~/.zplug/zplug

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    file:"fzf", \
    frozen:1
zplug "b4b4r07/enhancd", of:enhancd.sh;source ~/.zplug/repos/b4b4r07/enhancd/enhancd.sh

# Can manage local plugins
zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
