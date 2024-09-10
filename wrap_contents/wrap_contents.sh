#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <middle_file> <ends_file> <output_file>"
  exit 1
fi

middle_file=$1
ends_file=$2
output_file=$3

# Check if the input files exist
if [ ! -f "$middle_file" ]; then
  echo "Error: $middle_file does not exist."
  exit 1
fi
if [ ! -f "$ends_file" ]; then
  echo "Error: $ends_file does not exist."
  exit 1
fi

# Read the content of the ends file
header=$(head -n 1 "$ends_file")
footer=$(tail -n 1 "$ends_file")

# Create the output file
{
  echo "$header"
  cat "$middle_file"
  echo "$footer"
} > "$output_file"