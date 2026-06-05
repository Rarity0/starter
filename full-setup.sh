#!/bin/bash

run_script() {
    echo "Running $1..."
    if ./"$1"; then
        echo "✓ $1 completed successfully"
    else
        echo "✗ $1 failed!"
        exit 1
    fi
}

run_script "scripts/install-packages.sh"
run_script "scripts/render-files.sh"