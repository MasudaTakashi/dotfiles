#!/bin/sh

# download neobundle files
if [ -e ~/.vim/bundle/neobundle.vim ]; then
    echo "neobundle found"
    is_existed=true
else
    echo "install neobundle"
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/Shougo/neobundle.vim \
    ~/.vim/bundle/neobundle.vim
    is_existed=false
fi

# install & update NeoBundle plugins
if [ "${is_existed}" == true ]; then
    echo "running NeoBundleUpdate...\n"
    vim -u ~/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1
else
    echo "running NeoBundleInstall...\n"
    vim -u ~/.vimrc -i NONE -c "try | NeoBundleInstall! | finally | q! | endtry" -e -s -V1
fi
log_pass "\ncompleted!"
