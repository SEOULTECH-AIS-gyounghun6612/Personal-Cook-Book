#! /bin/bash

echo "DEBUG:set_cuda_path"

OLD_PATH=$PATH
PATH="/usr/local/cuda-12.5/bin:$PATH"  # CUDA 12.5

if [ -n "$LD_LIBRARY_PATH" ];
then # OLD_LD_LIBRARY_PATH가 비어있지 않은 경우
    OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
    LD_LIBRARY_PATH="/usr/local/cuda-12.5/lib64:$LD_LIBRARY_PATH"
fi

echo "Set CUDA path in PATH"
