#!/bin/bash

${PYTHON} -m pip install . --no-deps -vv
find ${PREFIX}  -name '*.js.map' -delete

if [ `uname` == Darwin ]
then
    chmod +x $RECIPE_DIR/jupyter_mac.command 
    cp $RECIPE_DIR/jupyter_mac.command $PREFIX/bin
fi
