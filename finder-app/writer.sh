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
    if [ ! -f "$writefile" ]; then
        echo "Error: Directory $writefile does not exist."
        echo "type any key to exit"
        read dummy # it is used for delay 
        exit 1
    fi
}


two_argument_input_checker "$@"
writefile=$1
writestr=$2
mkdir -p "$(dirname "$writefile")"
touch "$writefile"
directory_checker
echo "$writestr" > "$writefile"
