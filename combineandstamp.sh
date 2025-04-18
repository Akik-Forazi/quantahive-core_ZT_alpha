#!/bin/bash

output_file="combined_proof.txt"
> "$output_file"  # Clear or create

# Files to include
files=("LICENSE.txt" "LICENSE.txt.ots" "README.md" "README.md.ots" "theory.txt" "theory.txt.ots" "proof.txt" "proof.txt.ots")

# Combine all
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "==================== $file ====================" >> "$output_file"
        cat "$file" >> "$output_file"
        echo -e "\n" >> "$output_file"
    else
        echo "Warning: $file not found."
    fi
done

# Apply OpenTimestamp to the final combined file
ots stamp "$output_file"

echo "All contents merged and timestamped in '$output_file' and '$output_file.ots'"
