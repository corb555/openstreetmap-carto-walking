#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <scaling_factor>"
    exit 1
fi

input_file=$1
scaling_factor=$2

# Get the current width and height
size_line=$(gdalinfo "$input_file" | grep "Size is")
read -r _ _ width height <<< "$(echo "$size_line" | tr -d ',')"

echo $width
echo $height

# Calculate the new dimensions after scaling
new_width=$((width * scaling_factor))
new_height=$((height * scaling_factor))

# Output file name
output_file="${input_file%.*}_res.tif"

# Run gdalwarp
gdalwarp -overwrite -r lanczos -ts $new_width  $new_height "$input_file" "$output_file"

echo "Resampled file saved as: $output_file"
