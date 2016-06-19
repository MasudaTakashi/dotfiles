source ~/.zplug/zplug

# Can manage local plugins
zplug "~/.zsh", from:local

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf", \
    frozen:1
zplug "b4b4r07/enhancd", use:enhancd.sh;source ~/.zplug/repos/b4b4r07/enhancd/enhancd.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:19
