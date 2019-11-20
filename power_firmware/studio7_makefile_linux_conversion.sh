#!/bin/sh

# Rafael Corsi
# corsiferrao@gmail.com
#
# Script to convert makefile generate from atmel studio 7 (windows)
#  to linux path, assuming that you have gcc on PATH
# 
# based on https://gist.github.com/theterg/6082389 
# GPL

PROJECT_NAME=$1

if [ "$PROJECT_NAME" != "" ]; then

  #TARGET_DIR=${PROJECT_NAME}/Debug
  TARGET_DIR=${PROJECT_NAME}
  
  # remove ref to gcc windows path
  sed -i 's/C:\\.*\\bin\\//g' $TARGET_DIR/Makefile

  # remove ref to extension .bin
  sed -i 's/.exe//g' $TARGET_DIR/Makefile

  # remove SHELL
  sed -i 's/SHELL := cmd//g' $TARGET_DIR/Makefile

else

  echo "Usage: studio7_linux_conversion.sh PROJECT_NAME (e.g. the project directory name)"

fi




