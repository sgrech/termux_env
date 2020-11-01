#!/bin/bash
source ./helpers/log_helper.sh
source ./helpers/pkg_helper.sh

printInfo "Hello Info"
printWarn "Hello Warn"
printErr "Hello Error"

pkgInstall nvim
