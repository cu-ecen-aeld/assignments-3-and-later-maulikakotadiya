#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <search_string>"
    exit 1
fi

# Store the arguments in variables
filesdir="$1"
searchstr="$2"

# Check if filesdir is specified and is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Function to find matching lines in a file
count_matching_lines() {
    local file="$1"
    local search="$2"
    grep -c "$search" "$file"
}

# Initialize counts
file_count=0
line_count=0

# Loop through files and subdirectories and find matching lines
find "$filesdir" -type f | while read -r file; do
    file_count=$((file_count + 1))
    matching_lines=$(count_matching_lines "$file" "$searchstr")
    line_count=$((line_count + matching_lines))
done

# Print the results
echo "The number of files are $file_count and the number of matching lines are $line_count"
