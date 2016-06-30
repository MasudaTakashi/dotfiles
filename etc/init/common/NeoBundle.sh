#!/bin/sh

# Load common libray
. "$DOTPATH"/etc/scripts/common.sh



# download neobundle files
if [ -e ~/.vim/bundle/neobundle.vim ]; then
    log_pass "NeoBundle already installed"
    is_existed=true
else
    log_echo "Install NeoBundle..."
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/Shougo/neobundle.vim \
    ~/.vim/bundle/neobundle.vim

    # not found in 'runtimepath': "autoload/vimproc.vim"のエラーを避ける
    git clone https://github.com/Shougo/vimproc.vim.git \
    ~/.vim/bundle/vimproc.vim
    cd ~/.vim/bundle/vimproc.vim
    make
    cd $DOTPATH
    is_existed=false
fi

# install & update NeoBundle plugins
if [ "${is_existed}" == true ]; then
    log_echo "running NeoBundleUpdate..."
    vim -u ~/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1
else
    log_echo "running NeoBundleInstall...\n"
    vim -u ~/.vimrc -i NONE -c "try | NeoBundleInstall! | finally | q! | endtry" -e -s -V1
fi
echo "\n"
log_pass "install & update NeoBundle completed!"
