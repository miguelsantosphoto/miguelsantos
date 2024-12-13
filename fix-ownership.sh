#!/bin/bash

echo "Finding files owned by root..."

# Find all files owned by root
root_files=$(find . -user root)

if [ -z "$root_files" ]; then
    echo "No files owned by root found."
else
    echo "Files owned by root:"
    echo "$root_files"

    echo "Changing ownership to current user..."
    sudo chown -R $(whoami):$(whoami) .

    echo "Fixing permissions..."
    # Fix file permissions
    find . -type f -exec chmod 644 {} +
    # Fix directory permissions
    find . -type d -exec chmod 755 {} +

    echo "Ownership and permissions fixed."
fi
