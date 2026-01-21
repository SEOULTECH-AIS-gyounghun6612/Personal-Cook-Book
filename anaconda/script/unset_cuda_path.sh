#! /bin/bash

# This script is intended to be sourced by Conda (deactivate.d)
# It restores the original environment variables.

if [ -z "$OLD_PATH" ]; then
    # Nothing to restore
    return 0 2>/dev/null || exit 0
fi

# Restore PATH
export PATH="$OLD_PATH"
unset OLD_PATH

# Restore LD_LIBRARY_PATH
if [ -n "$OLD_LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH="$OLD_LD_LIBRARY_PATH"
else
    # If OLD_LD_LIBRARY_PATH was empty, LD_LIBRARY_PATH was either unset or empty
    unset LD_LIBRARY_PATH
fi
unset OLD_LD_LIBRARY_PATH

