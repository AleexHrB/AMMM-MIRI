#!/bin/bash

# Loop through all files in the current directory
for file in $(ls project.*); do
    # Extract the number from the filename using regex
    number=$(echo "$file" | grep -oP '\d+' | head -1)
    # Check if the number is greater than 8
    if [[ $number -gt 8 ]]; then
        # Delete the file
        rm "$file"
        echo "Deleted: $file"
    fi
done
rm generator.exe

