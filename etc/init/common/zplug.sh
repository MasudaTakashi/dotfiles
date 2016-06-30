#!/bin/bash

# Load common libray
. "$DOTPATH"/etc/scripts/common.sh

if [[ -f ~/.zplug/init.zsh ]]; then
    log_pass "zplug: already installed"
else
    if ! has "git"; then
        log_fail "git: command not found" >&2
        exit 1
    fi

    git clone \
        https://github.com/zplug/zplug \
        ~/.zplug
    log_pass "zplug: installed successfully"
fi

if [[ ! -f ~/.zplug/init.zsh ]]; then
    echo "zplug: not found" >&2
    exit 1
fi
# load zplug
source ~/.zplug/init.zsh

if [[ -f $DOTPATH/.zsh/zplug.zsh ]]; then
    export ZPLUG_LOADFILE="$DOTPATH/.zsh/zplug.zsh"
fi

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi
zplug load --verbose
