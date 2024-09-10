#!/bin/bash

# Extract contents of r0_input.txt
sed -E 's/^\* ([^,]+), ([^,]+)$/1. \1\n2. \2/' r0_input.txt > r0_output.txt

# Extract contents of r1_input.txt and exclude the fourth option
sed -E '/^\* I am awesome/d; /^\* I am ([^.]+)\. My favorite sandwich is ([^.]+)\.$/!d; s/^\* I am ([^.]+)\. My favorite sandwich is ([^.]+)\.$/1. \1\n2. \2/' r1_input.txt > r1_output.txt

# Extract contents of r2_input.txt and format to match the target output
sed -E 's/^\* sandwich with ([^.]+)\.([^.]+)\.([^.]+)\. for ([^.]+)$/1. \1.\2.\3.\n2. for \4/; s/^\* sandwich with ([^.]+)\.([^.]+)\. for ([^.]+)$/1. \1.\2.\n2. for \3/; s/^\* sandwich with ([^.]+)\. for ([^.]+)$/1. \1.\n2. for \2/; s/^\* sandwich with ([^.]+)\. to go$/1. \1.\n2. to go/' r2_input.txt > r2_output.txt

# Ensure the line with ham.cheddar. to go is formatted correctly
sed -i -E 's/^\* sandwich with ([^.]+)\.([^.]+)\. to go$/1. \1.\2.\n2. to go/' r2_output.txt