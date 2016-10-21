#!/bin/bash

# Prepare powerline fonts
echo "Prepareing powerline fonts ..."
POWERLINE_FONTS=$HOME/tmp/powerline_fonts
if [ ! -d $POWERLINE_FONTS ]; then
  echo "Installing..."
  mkdir -p $POWERLINE_FONTS
  git clone https://github.com/powerline/fonts.git $POWERLINE_FONTS
  cd $POWERLINE_FONTS
  ./install.sh
fi
echo "Done!"
