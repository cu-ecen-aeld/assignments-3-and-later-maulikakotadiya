#!/bin/bash

# Check if both arguments are provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <directory> [text_to_write] [number_of_files]"
    exit 1
fi

# Store the arguments in variables
writefile="$1"
writestr="${2:-AELD_IS_FUN}"
num_files="${3:-10}"

# Check if the directory is specified
if [ -z "$writefile" ]; then
    echo "Error: The directory is not specified."
    exit 1
fi

# Create the directory if it doesn't exist
if [ ! -d "$writefile" ]; then
    mkdir -p "$writefile"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create the directory '$writefile'."
        exit 1
    fi
fi

# Loop to create the specified number of files with the given content
for ((i = 1; i <= num_files; i++)); do
    file_path="$writefile/file$i.txt"
    echo "$writestr" > "$file_path"

    # Check if the file was created successfully
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create or write to the file '$file_path'."
        exit 1
    fi

    echo "File '$file_path' created and content written successfully."
done

echo "Finished writing $num_files files in the directory '$writefile'."
