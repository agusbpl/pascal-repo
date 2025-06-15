#!/bin/bash

# Check if the script is being run in the intended directory
echo "Running script in directory: $(pwd)"

# Delete files with .o extension
find . -type f -name "*.o" -delete

# Delete files with .ppu extension
find . -type f -name "*.ppu" -delete

echo "Files with .o and .ppu extensions have been deleted."

