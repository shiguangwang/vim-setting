#!/bin/bash

sudo apt-get install python-dev python3-dev cmake ruby ruby-dev

# install watchman
WATCHMAN=$HOME/tmp/watchman
if [ ! -d $WATCHMAN ]; then
  mkdir -p $WATCHMAN
  git clone https://github.com/facebook/watchman.git $WATCHMAN
  cd $WATCHMAN
  git checkout v4.7.0
  ./autogen.sh
  ./configure
  make
  sudo make install
fi

./prepare_common.sh
