#!/bin/bash

PYENV_PATH="$HOME/.pyenv"
PYENV_VIRTUALENV_PATH="$HOME/.pyenv/plugins/pyenv-virtualenv"

# Load common libray
. "$DOTPATH"/etc/scripts/common.sh

# pyenv
if [[ -d $PYENV_PATH ]]; then
    log_pass "pyenv: already installed"
else
    if ! has "git"; then
        log_fail "git: command not found" >&2
        exit 1
    fi

    git clone \
        https://github.com/yyuu/pyenv.git \
        $PYENV_PATH
    log_pass "pyenv: installed successfully"
fi


# pyenv-virtualenv
if [[ -d $PYENV_VIRTUALENV_PATH ]]; then
    log_pass "pyenv-virtualenv: already installed"
else
    if ! has "git"; then
        log_fail "git: command not found" >&2
        exit 1
    fi

    git clone \
        https://github.com/yyuu/pyenv-virtualenv.git \
        $PYENV_VIRTUALENV_PATH
    log_pass "pyenv-virtualenv: installed successfully"
fi
