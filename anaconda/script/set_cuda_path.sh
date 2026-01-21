#! /bin/bash

# This script is intended to be sourced by Conda (activate.d)
# It sets the CUDA environment variables for the current session.

# Prevent running multiple times and losing the original path
if [ -n "$OLD_PATH" ]; then
    # Already set, do nothing to prevent nesting
    return 0 2>/dev/null || exit 0
fi

CUDA_HOME="/usr/local/cuda-12.5"

if [ ! -d "$CUDA_HOME" ]; then
    echo "Warning: CUDA directory '$CUDA_HOME' not found."
    # We still proceed or return? If directory is missing, setting path is useless.
    # But usually better to warn and return than break the shell.
    return 0 2>/dev/null || exit 0
fi

export OLD_PATH="$PATH"
export PATH="$CUDA_HOME/bin:$PATH"

# Handle LD_LIBRARY_PATH
if [ -n "$LD_LIBRARY_PATH" ]; then
    export OLD_LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$LD_LIBRARY_PATH"
else
    export OLD_LD_LIBRARY_PATH=""
    export LD_LIBRARY_PATH="$CUDA_HOME/lib64"
fi

