# ------------------------------
# PATH Settings
# ------------------------------

#export DOTPATH="${0:A:t}"
export DOTPATH="$HOME/dotfiles"

# bin
export PATH="$DOTPATH/bin:$PATH"

### pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
