#!/bin/bash
source ./helpers/log_helper.sh
source ./helpers/pkg_helper.sh

printInfo "Hello Info"
printWarn "Hello Warn"
printErr "Hello Error"

forceRelinkFile ~/.config/nvim/init.vim ~/Workspace/env/dot-configs/init.vim
forceRelinkFile ~/.tmux.conf ~/Workspace/env/dot-configs/.tmux.conf
# pkgInstall nvim
