#!/bin/sh
DF_DIR=`dirname "$0"`
DF_DIR=`( cd "$DF_DIR" && pwd )`
for file in $DF_DIR/configuration/*
do
  ln -sfhv $file ~/.`basename $file`
done

ln -sfhv $DF_DIR/themes $DF_DIR/repos/oh-my-zsh/custom/themes
