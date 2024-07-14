#!/bin/bash

two_argument_input_checker(){
    # Check whether the amount of arguments was inserted properly 
    if [ $# -ne 2 ]; then
        echo "Error: Two arguments are required."
        echo "Usage: $0 <path_to_directory> <search_string>"
        echo "type any key to exit"
        read dummy # it is used for delay 
        exit 1
    fi
}


directory_checker(){
    # Check if the provided directory exists and is a directory
    if [ ! -d "$filesdir" ]; then
        echo "Error: Directory $filesdir does not exist."
        echo "type any key to exit"
        read dummy # it is used for delay 
        exit 1
    fi
}


two_argument_input_checker "$@"
filesdir=$1
searchstr=$2
directory_checker

file_num=$(find "$filesdir" -type f | wc -l)
line_num=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the result
echo "The number of files are $file_num and the number of matching lines are $line_num"
