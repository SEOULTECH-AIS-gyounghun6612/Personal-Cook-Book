#! /bin/bash

if [ -n "$OLD_PATH" ]
then
    PATH="$OLD_PATH"
    unset OLD_PATH
fi

if [ -n "$OLD_LD_LIBRARY_PATH" ];
then # OLD_LD_LIBRARY_PATH가 비어있지 않은 경우
    LD_LIBRARY_PATH="$OLD_LD_LIBRARY_PATH"
    unset OLD_LD_LIBRARY_PATH
fi
echo "Unset CUDA path in PATH"
