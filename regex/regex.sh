#!/bin/bash

# Define input and output files
input_files=("regex/r0_input.txt" "regex/r1_input.txt" "regex/r2_input.txt")
output_files=("regex/r0_output.txt" "regex/r1_output.txt" "regex/r2_output.txt")

# Loop through each input file
for i in "${!input_files[@]}"; do
  input_file="${input_files[$i]}"
  output_file="${output_files[$i]}"

  # Check if input file exists
  if [[ ! -f "$input_file" ]]; then
    echo "Input file $input_file does not exist."
    exit 1
  fi

  # Clear the output file
  > "$output_file"

  # Process the input file
  while IFS= read -r line; do
    # Extract the name and favorite item using regex
    if [[ "$line" =~ \*([[:space:]]+)([^,]+),([[:space:]]+)([^,]+) ]]; then
      name="${BASH_REMATCH[2]}"
      item="${BASH_REMATCH[4]}"
      echo "1. $name" >> "$output_file"
      echo "2. $item" >> "$output_file"
    fi
  done < "$input_file"
done