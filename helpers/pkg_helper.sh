#!/bin/bash

function pkgInstall() {
  for PACKAGE in $@
  do
    echo [[ -e "$(which $PACKAGE)" ]]
   # if [ -e "$(which $PACKAGE)" ]
   # then
   #   printInfo "Ok"
   # else
   # then
   #   printWarn "Installing ${PACKAGE}"
   # fi
  done
}
