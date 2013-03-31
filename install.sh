#!/bin/sh
DF_DIR=`dirname "$0"`
DF_DIR=`( cd "$DF_DIR" && pwd )`
for file in $DF_DIR/configuration/*
do
  ln -sfv $file ~/.`basename $file`
done
